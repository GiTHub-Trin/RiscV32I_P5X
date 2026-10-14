// ============================================================================
// control_unit.v - main decoder: opcode -> pipeline control signals
//
// Unused/unknown opcodes (incl. FENCE, ECALL, EBREAK, all-zero words) decode
// to a harmless NOP (no register write, no memory access, no branch).
// ============================================================================
`include "riscv_defs.vh"

module control_unit (
    input  wire [6:0] opcode,

    output reg        reg_write,   // WB : write rd
    output reg  [1:0] wb_sel,      // WB : ALU / MEM / PC+4
    output reg        mem_read,    // MEM: load
    output reg        mem_write,   // MEM: store
    output reg  [1:0] alu_src_a,   // EX : rs1 / PC / 0
    output reg        alu_src_b,   // EX : rs2 / imm
    output reg  [1:0] alu_op,      // EX : ALU decoder class
    output reg        branch,      // EX : conditional branch
    output reg        jal,         // EX : unconditional jump (PC-relative)
    output reg        jalr,        // EX : unconditional jump (register)
    output reg        uses_rs1,    // hazard unit: instruction reads rs1
    output reg        uses_rs2     // hazard unit: instruction reads rs2
);
    always @(*) begin
        // defaults = NOP
        reg_write = 1'b0;
        wb_sel    = `WB_ALU;
        mem_read  = 1'b0;
        mem_write = 1'b0;
        alu_src_a = `A_RS1;
        alu_src_b = `B_RS2;
        alu_op    = `ALUOP_ADD;
        branch    = 1'b0;
        jal       = 1'b0;
        jalr      = 1'b0;
        uses_rs1  = 1'b0;
        uses_rs2  = 1'b0;

        case (opcode)
            `OPC_OP: begin
                reg_write = 1'b1;
                alu_op    = `ALUOP_R;
                uses_rs1  = 1'b1;
                uses_rs2  = 1'b1;
            end
            `OPC_OPIMM: begin
                reg_write = 1'b1;
                alu_src_b = `B_IMM;
                alu_op    = `ALUOP_I;
                uses_rs1  = 1'b1;
            end
            `OPC_LOAD: begin
                reg_write = 1'b1;
                wb_sel    = `WB_MEM;
                mem_read  = 1'b1;
                alu_src_b = `B_IMM;
                uses_rs1  = 1'b1;
            end
            `OPC_STORE: begin
                mem_write = 1'b1;
                alu_src_b = `B_IMM;
                uses_rs1  = 1'b1;
                uses_rs2  = 1'b1;
            end
            `OPC_BRANCH: begin
                branch    = 1'b1;       // compare in branch_unit, target = PC + imm
                uses_rs1  = 1'b1;
                uses_rs2  = 1'b1;
            end
            `OPC_LUI: begin
                reg_write = 1'b1;
                alu_src_a = `A_ZERO;    // 0 + imm
                alu_src_b = `B_IMM;
            end
            `OPC_AUIPC: begin
                reg_write = 1'b1;
                alu_src_a = `A_PC;      // PC + imm
                alu_src_b = `B_IMM;
            end
            `OPC_JAL: begin
                reg_write = 1'b1;
                wb_sel    = `WB_PC4;
                jal       = 1'b1;
            end
            `OPC_JALR: begin
                reg_write = 1'b1;
                wb_sel    = `WB_PC4;
                alu_src_b = `B_IMM;     // target = (rs1 + imm) & ~1 via ALU
                jalr      = 1'b1;
                uses_rs1  = 1'b1;
            end
            default: ;                  // FENCE, SYSTEM, unknown -> NOP
        endcase
    end
endmodule
