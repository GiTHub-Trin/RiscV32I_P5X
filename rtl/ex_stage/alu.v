// ============================================================================
// alu.v - 32-bit integer ALU for RV32I
// ============================================================================
`include "riscv_defs.vh"

module alu (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_ctrl,
    output reg  [31:0] result
);
    wire signed [31:0] sa    = a;
    wire signed [31:0] sb    = b;
    wire        [4:0]  shamt = b[4:0];
    wire signed [31:0] sra_r = sa >>> shamt;

    always @(*) begin
        case (alu_ctrl)
            `ALU_ADD:  result = a + b;
            `ALU_SUB:  result = a - b;
            `ALU_SLL:  result = a << shamt;
            `ALU_SLT:  result = (sa < sb) ? 32'd1 : 32'd0;
            `ALU_SLTU: result = (a  < b ) ? 32'd1 : 32'd0;
            `ALU_XOR:  result = a ^ b;
            `ALU_SRL:  result = a >> shamt;
            `ALU_SRA:  result = sra_r;
            `ALU_OR:   result = a | b;
            `ALU_AND:  result = a & b;
            default:   result = 32'd0;
        endcase
    end
endmodule
