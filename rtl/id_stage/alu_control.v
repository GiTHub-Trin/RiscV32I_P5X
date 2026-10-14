// ============================================================================
// alu_control.v - secondary decoder: (alu_op, funct3, funct7[5]) -> alu_ctrl
// ============================================================================
`include "riscv_defs.vh"

module alu_control (
    input  wire [1:0] alu_op,
    input  wire [2:0] funct3,
    input  wire       funct7_5,     // instr[30]
    output reg  [3:0] alu_ctrl
);
    always @(*) begin
        case (alu_op)
            `ALUOP_R, `ALUOP_I: begin
                case (funct3)
                    3'b000:  alu_ctrl = (alu_op == `ALUOP_R && funct7_5) ? `ALU_SUB : `ALU_ADD;
                    3'b001:  alu_ctrl = `ALU_SLL;
                    3'b010:  alu_ctrl = `ALU_SLT;
                    3'b011:  alu_ctrl = `ALU_SLTU;
                    3'b100:  alu_ctrl = `ALU_XOR;
                    3'b101:  alu_ctrl = funct7_5 ? `ALU_SRA : `ALU_SRL;
                    3'b110:  alu_ctrl = `ALU_OR;
                    default: alu_ctrl = `ALU_AND;
                endcase
            end
            default: alu_ctrl = `ALU_ADD;
        endcase
    end
endmodule
