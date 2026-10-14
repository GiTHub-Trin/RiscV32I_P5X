// ============================================================================
// id_stage.v - Instruction Decode
//   field extraction, register-file read, immediate generation, control decode
//   (the register file's write port is driven from the WB stage)
// ============================================================================
`include "riscv_defs.vh"

module id_stage (
    input  wire        clk,
    input  wire [31:0] instr,

    // Write port (from WB)
    input  wire        wb_we,
    input  wire [4:0]  wb_rd,
    input  wire [31:0] wb_data,

    // Datapath outputs
    output wire [31:0] rs1_data,
    output wire [31:0] rs2_data,
    output wire [31:0] imm,
    output wire [4:0]  rs1,
    output wire [4:0]  rs2,
    output wire [4:0]  rd,
    output wire [2:0]  funct3,

    // Control outputs
    output wire        reg_write,
    output wire [1:0]  wb_sel,
    output wire        mem_read,
    output wire        mem_write,
    output wire [1:0]  alu_src_a,
    output wire        alu_src_b,
    output wire [3:0]  alu_ctrl,
    output wire        branch,
    output wire        jal,
    output wire        jalr,
    output wire        uses_rs1,
    output wire        uses_rs2
);
    wire [1:0] alu_op;

    assign rs1    = instr[19:15];
    assign rs2    = instr[24:20];
    assign rd     = instr[11:7];
    assign funct3 = instr[14:12];

    regfile u_regfile (
        .clk   (clk),
        .we    (wb_we),
        .waddr (wb_rd),
        .wdata (wb_data),
        .raddr1(rs1),
        .raddr2(rs2),
        .rdata1(rs1_data),
        .rdata2(rs2_data)
    );

    imm_gen u_imm_gen (
        .instr(instr),
        .imm  (imm)
    );

    control_unit u_control (
        .opcode   (instr[6:0]),
        .reg_write(reg_write),
        .wb_sel   (wb_sel),
        .mem_read (mem_read),
        .mem_write(mem_write),
        .alu_src_a(alu_src_a),
        .alu_src_b(alu_src_b),
        .alu_op   (alu_op),
        .branch   (branch),
        .jal      (jal),
        .jalr     (jalr),
        .uses_rs1 (uses_rs1),
        .uses_rs2 (uses_rs2)
    );

    alu_control u_alu_control (
        .alu_op  (alu_op),
        .funct3  (funct3),
        .funct7_5(instr[30]),
        .alu_ctrl(alu_ctrl)
    );
endmodule
