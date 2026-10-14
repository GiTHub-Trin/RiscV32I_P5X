// ============================================================================
// branch_unit.v - branch condition evaluation + "redirect PC" decision
//   taken = JAL | JALR | (BRANCH & condition)
// ============================================================================
`include "riscv_defs.vh"

module branch_unit (
    input  wire [31:0] rs1,
    input  wire [31:0] rs2,
    input  wire [2:0]  funct3,
    input  wire        branch,
    input  wire        jal,
    input  wire        jalr,
    output wire        taken
);
    wire eq  = (rs1 == rs2);
    wire lt  = ($signed(rs1) < $signed(rs2));
    wire ltu = (rs1 < rs2);

    reg cond;
    always @(*) begin
        case (funct3)
            `F3_BEQ:  cond = eq;
            `F3_BNE:  cond = ~eq;
            `F3_BLT:  cond = lt;
            `F3_BGE:  cond = ~lt;
            `F3_BLTU: cond = ltu;
            `F3_BGEU: cond = ~ltu;
            default:  cond = 1'b0;
        endcase
    end

    assign taken = jal | jalr | (branch & cond);
endmodule
