# 5-Stage Pipelined RV32I CPU (Verilog-2001)

Classic IF / ID / EX / MEM / WB pipeline with full forwarding, load-use stall and
predict-not-taken branches. See [`ARCHITECTURE.md`](ARCHITECTURE.md) for the stage
descriptions, control-signal table and hazard rules.

```
riscv_cpu/
├── rtl/
│   ├── include/riscv_defs.vh      opcodes, ALU/select encodings
│   ├── if_stage/                  pc_reg.v  if_stage.v
│   ├── id_stage/                  regfile.v imm_gen.v control_unit.v alu_control.v id_stage.v
│   ├── ex_stage/                  alu.v branch_unit.v ex_stage.v
│   ├── mem_stage/                 mem_stage.v
│   ├── wb_stage/                  wb_stage.v
│   ├── hazard/                    hazard_unit.v forwarding_unit.v
│   ├── pipeline/                  if_id_reg.v id_ex_reg.v ex_mem_reg.v mem_wb_reg.v
│   ├── memory/                    imem.v dmem.v
│   └── top/                       riscv_core.v riscv_soc.v
├── tb/                            tb_if_stage.v tb_alu.v tb_regfile.v tb_riscv_core.v
├── sw/directed/                   alu_basic.s hazards.s mem_access.s
├── tools/                         rvasm.py (assembler) rvsim.py (golden ISS) gen_random.py
├── scripts/run_tests.sh
├── docs/ARCHITECTURE.md
└── Makefile
```

## Running the tests (Icarus Verilog + Python 3)

```
make test          # IF stage, ALU, regfile, directed programs, 25 random programs
make if_test       # just the Instruction Fetch testbench
make random_test SEEDS=100
```

`tb_riscv_core` runs a program on the whole CPU and compares the final register file with
`tools/rvsim.py`, a separate Python RV32I reference simulator. Random programs use a small register
pool, loads/stores and forward branches/jumps to stress forwarding, load-use stalls and flushes.
