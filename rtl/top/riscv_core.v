// ============================================================================
// riscv_core.v - 5-stage pipelined RV32I core (IF, ID, EX, MEM, WB)
//
//   IF  : PC, instruction fetch           (if_stage)
//   ID  : decode, register read, imm gen (id_stage)
//   EX  : ALU, branch resolve, forwarding (ex_stage)
//   MEM : data memory access              (mem_stage)
//   WB  : write-back mux                  (wb_stage)
//
//   Hazards : full forwarding (EX/MEM, MEM/WB), 1-cycle load-use stall,
//             branches/jumps resolved in EX with predict-not-taken
//             (2-cycle flush penalty), regfile write-through bypass.
// ============================================================================
`include "riscv_defs.vh"

module riscv_core #(
    parameter [31:0] RESET_PC = 32'h0000_0000
) (
    input  wire        clk,
    input  wire        rst,

    // Instruction memory interface
    output wire [31:0] imem_addr,
    input  wire [31:0] imem_rdata,

    // Data memory interface
    output wire [31:0] dmem_addr,
    output wire [31:0] dmem_wdata,
    output wire [3:0]  dmem_we,
    output wire        dmem_re,
    input  wire [31:0] dmem_rdata
);
    // ------------------------------------------------------------------
    // Hazard / redirect wiring
    // ------------------------------------------------------------------
    wire        pc_stall, if_id_en, if_id_flush, id_ex_flush;
    wire        ex_redirect_valid;
    wire [31:0] ex_redirect_pc;

    // ------------------------------------------------------------------
    // IF
    // ------------------------------------------------------------------
    wire [31:0] if_pc, if_pc_plus4, if_instr;

    if_stage #(.RESET_PC(RESET_PC)) u_if (
        .clk           (clk),
        .rst           (rst),
        .pc_stall      (pc_stall),
        .redirect_valid(ex_redirect_valid),
        .redirect_pc   (ex_redirect_pc),
        .imem_addr     (imem_addr),
        .imem_rdata    (imem_rdata),
        .if_pc         (if_pc),
        .if_pc_plus4   (if_pc_plus4),
        .if_instr      (if_instr)
    );

    // ------------------------------------------------------------------
    // IF/ID
    // ------------------------------------------------------------------
    wire [31:0] id_pc, id_pc_plus4, id_instr;

    if_id_reg u_if_id (
        .clk         (clk),
        .rst         (rst),
        .en          (if_id_en),
        .flush       (if_id_flush),
        .pc_in       (if_pc),
        .pc_plus4_in (if_pc_plus4),
        .instr_in    (if_instr),
        .pc_out      (id_pc),
        .pc_plus4_out(id_pc_plus4),
        .instr_out   (id_instr)
    );

    // ------------------------------------------------------------------
    // ID
    // ------------------------------------------------------------------
    wire [31:0] id_rs1_data, id_rs2_data, id_imm;
    wire [4:0]  id_rs1, id_rs2, id_rd;
    wire [2:0]  id_funct3;
    wire        id_reg_write, id_mem_read, id_mem_write, id_alu_src_b;
    wire        id_branch, id_jal, id_jalr, id_uses_rs1, id_uses_rs2;
    wire [1:0]  id_wb_sel, id_alu_src_a;
    wire [3:0]  id_alu_ctrl;

    // write-back signals (declared here, driven in WB section)
    wire        wb_reg_write;
    wire [4:0]  wb_rd;
    wire [31:0] wb_data;

    id_stage u_id (
        .clk      (clk),
        .instr    (id_instr),
        .wb_we    (wb_reg_write),
        .wb_rd    (wb_rd),
        .wb_data  (wb_data),
        .rs1_data (id_rs1_data),
        .rs2_data (id_rs2_data),
        .imm      (id_imm),
        .rs1      (id_rs1),
        .rs2      (id_rs2),
        .rd       (id_rd),
        .funct3   (id_funct3),
        .reg_write(id_reg_write),
        .wb_sel   (id_wb_sel),
        .mem_read (id_mem_read),
        .mem_write(id_mem_write),
        .alu_src_a(id_alu_src_a),
        .alu_src_b(id_alu_src_b),
        .alu_ctrl (id_alu_ctrl),
        .branch   (id_branch),
        .jal      (id_jal),
        .jalr     (id_jalr),
        .uses_rs1 (id_uses_rs1),
        .uses_rs2 (id_uses_rs2)
    );

    // ------------------------------------------------------------------
    // ID/EX
    // ------------------------------------------------------------------
    wire [31:0] ex_pc, ex_pc_plus4, ex_rs1_data, ex_rs2_data, ex_imm;
    wire [4:0]  ex_rs1, ex_rs2, ex_rd;
    wire [2:0]  ex_funct3;
    wire        ex_reg_write, ex_mem_read, ex_mem_write, ex_alu_src_b;
    wire        ex_branch, ex_jal, ex_jalr;
    wire [1:0]  ex_wb_sel, ex_alu_src_a;
    wire [3:0]  ex_alu_ctrl;

    id_ex_reg u_id_ex (
        .clk          (clk),
        .rst          (rst),
        .flush        (id_ex_flush),
        .pc_in        (id_pc),
        .pc_plus4_in  (id_pc_plus4),
        .rs1_data_in  (id_rs1_data),
        .rs2_data_in  (id_rs2_data),
        .imm_in       (id_imm),
        .rs1_in       (id_rs1),
        .rs2_in       (id_rs2),
        .rd_in        (id_rd),
        .funct3_in    (id_funct3),
        .reg_write_in (id_reg_write),
        .wb_sel_in    (id_wb_sel),
        .mem_read_in  (id_mem_read),
        .mem_write_in (id_mem_write),
        .alu_src_a_in (id_alu_src_a),
        .alu_src_b_in (id_alu_src_b),
        .alu_ctrl_in  (id_alu_ctrl),
        .branch_in    (id_branch),
        .jal_in       (id_jal),
        .jalr_in      (id_jalr),
        .pc_out       (ex_pc),
        .pc_plus4_out (ex_pc_plus4),
        .rs1_data_out (ex_rs1_data),
        .rs2_data_out (ex_rs2_data),
        .imm_out      (ex_imm),
        .rs1_out      (ex_rs1),
        .rs2_out      (ex_rs2),
        .rd_out       (ex_rd),
        .funct3_out   (ex_funct3),
        .reg_write_out(ex_reg_write),
        .wb_sel_out   (ex_wb_sel),
        .mem_read_out (ex_mem_read),
        .mem_write_out(ex_mem_write),
        .alu_src_a_out(ex_alu_src_a),
        .alu_src_b_out(ex_alu_src_b),
        .alu_ctrl_out (ex_alu_ctrl),
        .branch_out   (ex_branch),
        .jal_out      (ex_jal),
        .jalr_out     (ex_jalr)
    );

    // ------------------------------------------------------------------
    // EX (+ forwarding)
    // ------------------------------------------------------------------
    wire [1:0]  fwd_a, fwd_b;
    wire [31:0] ex_alu_result, ex_store_data;

    // MEM-stage values used for forwarding (declared here)
    wire [4:0]  mem_rd;
    wire        mem_reg_write;
    wire [31:0] mem_fwd_data;

    forwarding_unit u_fwd (
        .ex_rs1       (ex_rs1),
        .ex_rs2       (ex_rs2),
        .mem_rd       (mem_rd),
        .mem_reg_write(mem_reg_write),
        .wb_rd        (wb_rd),
        .wb_reg_write (wb_reg_write),
        .fwd_a        (fwd_a),
        .fwd_b        (fwd_b)
    );

    ex_stage u_ex (
        .pc            (ex_pc),
        .rs1_data      (ex_rs1_data),
        .rs2_data      (ex_rs2_data),
        .imm           (ex_imm),
        .alu_src_a     (ex_alu_src_a),
        .alu_src_b     (ex_alu_src_b),
        .alu_ctrl      (ex_alu_ctrl),
        .funct3        (ex_funct3),
        .branch        (ex_branch),
        .jal           (ex_jal),
        .jalr          (ex_jalr),
        .fwd_a         (fwd_a),
        .fwd_b         (fwd_b),
        .fwd_mem_data  (mem_fwd_data),
        .fwd_wb_data   (wb_data),
        .alu_result    (ex_alu_result),
        .store_data    (ex_store_data),
        .redirect_valid(ex_redirect_valid),
        .redirect_pc   (ex_redirect_pc)
    );

    hazard_unit u_hazard (
        .ex_mem_read(ex_mem_read),
        .ex_rd      (ex_rd),
        .id_rs1     (id_rs1),
        .id_rs2     (id_rs2),
        .id_uses_rs1(id_uses_rs1),
        .id_uses_rs2(id_uses_rs2),
        .ex_redirect(ex_redirect_valid),
        .pc_stall   (pc_stall),
        .if_id_en   (if_id_en),
        .if_id_flush(if_id_flush),
        .id_ex_flush(id_ex_flush)
    );

    // ------------------------------------------------------------------
    // EX/MEM
    // ------------------------------------------------------------------
    wire [31:0] mem_pc_plus4, mem_alu_result, mem_store_data;
    wire [2:0]  mem_funct3;
    wire [1:0]  mem_wb_sel;
    wire        mem_mem_read, mem_mem_write;

    ex_mem_reg u_ex_mem (
        .clk           (clk),
        .rst           (rst),
        .pc_plus4_in   (ex_pc_plus4),
        .alu_result_in (ex_alu_result),
        .store_data_in (ex_store_data),
        .rd_in         (ex_rd),
        .funct3_in     (ex_funct3),
        .reg_write_in  (ex_reg_write),
        .wb_sel_in     (ex_wb_sel),
        .mem_read_in   (ex_mem_read),
        .mem_write_in  (ex_mem_write),
        .pc_plus4_out  (mem_pc_plus4),
        .alu_result_out(mem_alu_result),
        .store_data_out(mem_store_data),
        .rd_out        (mem_rd),
        .funct3_out    (mem_funct3),
        .reg_write_out (mem_reg_write),
        .wb_sel_out    (mem_wb_sel),
        .mem_read_out  (mem_mem_read),
        .mem_write_out (mem_mem_write)
    );

    // ------------------------------------------------------------------
    // MEM
    // ------------------------------------------------------------------
    wire [31:0] mem_load_data;

    mem_stage u_mem (
        .alu_result(mem_alu_result),
        .store_data(mem_store_data),
        .pc_plus4  (mem_pc_plus4),
        .funct3    (mem_funct3),
        .wb_sel    (mem_wb_sel),
        .mem_read  (mem_mem_read),
        .mem_write (mem_mem_write),
        .dmem_addr (dmem_addr),
        .dmem_wdata(dmem_wdata),
        .dmem_we   (dmem_we),
        .dmem_re   (dmem_re),
        .dmem_rdata(dmem_rdata),
        .load_data (mem_load_data),
        .fwd_data  (mem_fwd_data)
    );

    // ------------------------------------------------------------------
    // MEM/WB
    // ------------------------------------------------------------------
    wire [31:0] wb_pc_plus4, wb_alu_result, wb_load_data;
    wire [1:0]  wb_wb_sel;

    mem_wb_reg u_mem_wb (
        .clk           (clk),
        .rst           (rst),
        .pc_plus4_in   (mem_pc_plus4),
        .alu_result_in (mem_alu_result),
        .load_data_in  (mem_load_data),
        .rd_in         (mem_rd),
        .reg_write_in  (mem_reg_write),
        .wb_sel_in     (mem_wb_sel),
        .pc_plus4_out  (wb_pc_plus4),
        .alu_result_out(wb_alu_result),
        .load_data_out (wb_load_data),
        .rd_out        (wb_rd),
        .reg_write_out (wb_reg_write),
        .wb_sel_out    (wb_wb_sel)
    );

    // ------------------------------------------------------------------
    // WB
    // ------------------------------------------------------------------
    wb_stage u_wb (
        .alu_result(wb_alu_result),
        .load_data (wb_load_data),
        .pc_plus4  (wb_pc_plus4),
        .wb_sel    (wb_wb_sel),
        .wb_data   (wb_data)
    );
endmodule
