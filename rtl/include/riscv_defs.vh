// ============================================================================
// riscv_defs.vh - shared constants for the RV32I 5-stage pipeline
// ============================================================================
`ifndef RISCV_DEFS_VH
`define RISCV_DEFS_VH

// ---- Major opcodes (instr[6:0]) -------------------------------------------
`define OPC_LUI     7'b0110111
`define OPC_AUIPC   7'b0010111
`define OPC_JAL     7'b1101111
`define OPC_JALR    7'b1100111
`define OPC_BRANCH  7'b1100011
`define OPC_LOAD    7'b0000011
`define OPC_STORE   7'b0100011
`define OPC_OPIMM   7'b0010011
`define OPC_OP      7'b0110011
`define OPC_FENCE   7'b0001111
`define OPC_SYSTEM  7'b1110011

// ---- Canonical NOP: addi x0, x0, 0 ----------------------------------------
`define INSTR_NOP   32'h0000_0013

// ---- ALU operation select (alu_ctrl, 4 bits) ------------------------------
`define ALU_ADD     4'd0
`define ALU_SUB     4'd1
`define ALU_SLL     4'd2
`define ALU_SLT     4'd3
`define ALU_SLTU    4'd4
`define ALU_XOR     4'd5
`define ALU_SRL     4'd6
`define ALU_SRA     4'd7
`define ALU_OR      4'd8
`define ALU_AND     4'd9

// ---- Main-control -> ALU-decoder class (alu_op, 2 bits) -------------------
`define ALUOP_ADD   2'b00   // force add (address calc, LUI, AUIPC, JALR)
`define ALUOP_R     2'b10   // R-type: decode funct3 + funct7[5]
`define ALUOP_I     2'b11   // I-type ALU: decode funct3, funct7[5] only for shifts

// ---- ALU operand A select (alu_src_a) -------------------------------------
`define A_RS1       2'd0
`define A_PC        2'd1    // AUIPC
`define A_ZERO      2'd2    // LUI

// ---- ALU operand B select (alu_src_b) -------------------------------------
`define B_RS2       1'b0
`define B_IMM       1'b1

// ---- Write-back select (wb_sel) -------------------------------------------
`define WB_ALU      2'd0
`define WB_MEM      2'd1
`define WB_PC4      2'd2    // JAL / JALR link value

// ---- Forwarding select (fwd_a / fwd_b) ------------------------------------
`define FWD_NONE    2'd0    // value read from register file (ID/EX register)
`define FWD_MEM     2'd1    // from EX/MEM stage register
`define FWD_WB      2'd2    // from MEM/WB stage register (final write-back value)

// ---- funct3 encodings -----------------------------------------------------
`define F3_BEQ      3'b000
`define F3_BNE      3'b001
`define F3_BLT      3'b100
`define F3_BGE      3'b101
`define F3_BLTU     3'b110
`define F3_BGEU     3'b111

`define F3_LB       3'b000
`define F3_LH       3'b001
`define F3_LW       3'b010
`define F3_LBU      3'b100
`define F3_LHU      3'b101

`define F3_SB       3'b000
`define F3_SH       3'b001
`define F3_SW       3'b010

`endif
