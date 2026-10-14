// ============================================================================
// ex_stage.v - Execute
//   * operand forwarding muxes (EX/MEM and MEM/WB -> ALU inputs)
//   * ALU operand selection (rs1 / PC / 0   and   rs2 / imm)
//   * ALU, branch comparator, branch/jump target
//   * Branches and jumps are resolved here (predict-not-taken, 2-cycle penalty)
// ============================================================================
`include "riscv_defs.vh"

module ex_stage (
    // From ID/EX register
    input  wire [31:0] pc,
    input  wire [31:0] rs1_data,
    input  wire [31:0] rs2_data,
    input  wire [31:0] imm,
    input  wire [1:0]  alu_src_a,
    input  wire        alu_src_b,
    input  wire [3:0]  alu_ctrl,
    input  wire [2:0]  funct3,
    input  wire        branch,
    input  wire        jal,
    input  wire        jalr,

    // From forwarding unit / later stages
    input  wire [1:0]  fwd_a,
    input  wire [1:0]  fwd_b,
    input  wire [31:0] fwd_mem_data,   // EX/MEM result
    input  wire [31:0] fwd_wb_data,    // MEM/WB final write-back value

    // Outputs
    output wire [31:0] alu_result,
    output wire [31:0] store_data,     // forwarded rs2 (for stores)
    output wire        redirect_valid,
    output wire [31:0] redirect_pc
);
    reg [31:0] rs1_f, rs2_f;

    always @(*) begin
        case (fwd_a)
            `FWD_MEM: rs1_f = fwd_mem_data;
            `FWD_WB:  rs1_f = fwd_wb_data;
            default:  rs1_f = rs1_data;
        endcase
        case (fwd_b)
            `FWD_MEM: rs2_f = fwd_mem_data;
            `FWD_WB:  rs2_f = fwd_wb_data;
            default:  rs2_f = rs2_data;
        endcase
    end

    wire [31:0] alu_a = (alu_src_a == `A_PC)   ? pc   :
                        (alu_src_a == `A_ZERO) ? 32'd0 : rs1_f;
    wire [31:0] alu_b = (alu_src_b == `B_IMM)  ? imm  : rs2_f;

    alu u_alu (
        .a       (alu_a),
        .b       (alu_b),
        .alu_ctrl(alu_ctrl),
        .result  (alu_result)
    );

    branch_unit u_branch (
        .rs1   (rs1_f),
        .rs2   (rs2_f),
        .funct3(funct3),
        .branch(branch),
        .jal   (jal),
        .jalr  (jalr),
        .taken (redirect_valid)
    );

    wire [31:0] pc_target = pc + imm;                         // branch / JAL
    assign redirect_pc = jalr ? {alu_result[31:1], 1'b0}      // (rs1 + imm) & ~1
                              : pc_target;
    assign store_data  = rs2_f;
endmodule
