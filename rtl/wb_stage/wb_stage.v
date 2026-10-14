// ============================================================================
// wb_stage.v - Write back: select ALU result / load data / PC+4
// ============================================================================
`include "riscv_defs.vh"

module wb_stage (
    input  wire [31:0] alu_result,
    input  wire [31:0] load_data,
    input  wire [31:0] pc_plus4,
    input  wire [1:0]  wb_sel,
    output reg  [31:0] wb_data
);
    always @(*) begin
        case (wb_sel)
            `WB_MEM: wb_data = load_data;
            `WB_PC4: wb_data = pc_plus4;
            default: wb_data = alu_result;
        endcase
    end
endmodule
