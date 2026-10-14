# RV32I 5-Stage Pipeline - Architecture Notes

```
      +------+   IF/ID   +------+   ID/EX   +------+   EX/MEM  +------+   MEM/WB  +------+
 PC-->|  IF  |==========>|  ID  |==========>|  EX  |==========>| MEM  |==========>|  WB  |--+
      +--^---+           +--^---+           +--^---+           +------+           +------+  |
         |  imem           |  regfile         |  fwd (EX/MEM, MEM/WB)                       |
         |                 +------------------+---------- write-back (rd, data, we) <------+
         +---------- redirect PC (taken branch / JAL / JALR, resolved in EX) ----+
```

## 1. Stages

| Stage | Module | Work done |
|-------|--------|-----------|
| **IF**  | `if_stage` (`pc_reg`) | Send PC to instruction memory, compute PC+4, choose next PC (redirect > stall-hold > PC+4). |
| **ID**  | `id_stage` (`regfile`, `imm_gen`, `control_unit`, `alu_control`) | Split instruction fields, read rs1/rs2 (with WB write-through bypass), build the immediate, decode all control signals. |
| **EX**  | `ex_stage` (`alu`, `branch_unit`) | Forward operands, select ALU inputs, run the ALU, compare for branches, compute branch/jump target and the redirect decision. |
| **MEM** | `mem_stage` | Drive the data memory (address, byte strobes, aligned store data) and extract/sign-extend load data. |
| **WB**  | `wb_stage` | Select ALU result / load data / PC+4 and write it to `rd`. |

Pipeline registers: `if_id_reg`, `id_ex_reg`, `ex_mem_reg`, `mem_wb_reg` (in `rtl/pipeline/`).
`hazard_unit` and `forwarding_unit` live in `rtl/hazard/`.

## 2. Control signals

Produced by `control_unit` / `alu_control` in ID, carried down the pipe with the instruction, and
consumed in the stage shown. A bubble is simply "all control bits = 0".

| Signal | Width | Consumed in | Meaning |
|--------|:----:|:----------:|---------|
| `alu_src_a`  | 2 | EX  | ALU operand A: `0` rs1, `1` PC (AUIPC), `2` zero (LUI) |
| `alu_src_b`  | 1 | EX  | ALU operand B: `0` rs2, `1` immediate |
| `alu_op`     | 2 | ID (alu_control) | `00` force ADD, `10` R-type, `11` I-type ALU |
| `alu_ctrl`   | 4 | EX  | ADD SUB SLL SLT SLTU XOR SRL SRA OR AND (from `alu_op`+`funct3`+`funct7[5]`) |
| `branch`     | 1 | EX  | conditional branch; `funct3` selects BEQ/BNE/BLT/BGE/BLTU/BGEU |
| `jal`        | 1 | EX  | unconditional PC-relative jump |
| `jalr`       | 1 | EX  | unconditional register jump, target = `(rs1+imm) & ~1` |
| `mem_read`   | 1 | EX (load-use check), MEM | load |
| `mem_write`  | 1 | MEM | store; with `funct3[1:0]` -> byte strobes `dmem_we[3:0]` |
| `funct3`     | 3 | EX, MEM | branch condition / access size & signedness |
| `wb_sel`     | 2 | MEM (fwd value), WB | `0` ALU result, `1` load data, `2` PC+4 (JAL/JALR link) |
| `reg_write`  | 1 | WB (and forwarding) | write `rd` |
| `uses_rs1/2` | 1 each | ID (hazard unit) | instruction really reads rs1 / rs2 (avoids false load-use stalls) |

Hazard-unit outputs: `pc_stall`, `if_id_en`, `if_id_flush`, `id_ex_flush`.
Forwarding-unit outputs: `fwd_a`, `fwd_b` (`0` regfile, `1` EX/MEM, `2` MEM/WB).
Redirect (EX -> IF): `redirect_valid`, `redirect_pc`.

### Pipeline register contents

| Register | Datapath | Control |
|----------|----------|---------|
| IF/ID  | `pc`, `pc+4`, `instr` | - |
| ID/EX  | `pc`, `pc+4`, `rs1_data`, `rs2_data`, `imm`, `rs1`, `rs2`, `rd`, `funct3` | `reg_write wb_sel mem_read mem_write alu_src_a alu_src_b alu_ctrl branch jal jalr` |
| EX/MEM | `pc+4`, `alu_result`, `store_data` (forwarded rs2), `rd`, `funct3` | `reg_write wb_sel mem_read mem_write` |
| MEM/WB | `pc+4`, `alu_result`, `load_data`, `rd` | `reg_write wb_sel` |

## 3. Hazard handling

* **RAW, distance 1 and 2** - forwarding. EX/MEM has priority over MEM/WB. The EX/MEM forward value is
  `PC+4` for JAL/JALR, otherwise the ALU result.
* **RAW, distance 3** - register file write-through bypass (WB value visible to a same-cycle ID read).
* **Load-use** - a load in EX with a dependent instruction in ID: freeze PC and IF/ID, insert a bubble
  into ID/EX (1 cycle). The data is then forwarded from MEM/WB.
* **Control** - branches/JAL/JALR resolve in EX, static predict-not-taken. When taken, the two younger
  instructions (IF/ID and ID/EX) are flushed and the PC loads the target: **2-cycle penalty**.
  Redirect has priority over stall (the two cannot actually coincide).
* **WAR/WAW** - impossible, register writes happen in order in WB.

## 4. Memory interfaces

* **Instruction memory** (`imem`): `imem_addr` (byte address) -> `imem_rdata` in the same cycle
  (combinational ROM). Out-of-range fetches return NOP. For an FPGA block RAM (synchronous read) you
  would add a fetch register or move the PC register behind the RAM address port.
* **Data memory** (`dmem`): word-wide, `dmem_addr` word aligned by MEM stage, `dmem_we[3:0]` byte strobes,
  synchronous write, combinational read.

## 5. Scope / simplifications

* RV32I base integer ISA only. `FENCE`, `ECALL`, `EBREAK` and unknown encodings execute as NOPs
  (no traps, no CSRs, no exceptions).
* Loads/stores and jump targets are assumed naturally aligned (no misalignment exceptions).
* Register file is not reset (zero-initialised in simulation); pipeline registers are reset.
* No branch predictor, no caches, single-issue in-order.
