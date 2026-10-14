// ============================================================================
// if_id_reg.v - IF/ID pipeline register
//   flush : load a NOP bubble (wins over en)
//   en    : 0 = hold (load-use stall)
// ============================================================================
`include "riscv_defs.vh"

module if_id_reg (
    input  wire        clk,
    input  wire        rst,
    input  wire        en,
    input  wire        flush,
    input  wire [31:0] pc_in,
    input  wire [31:0] pc_plus4_in,
    input  wire [31:0] instr_in,
    output reg  [31:0] pc_out,
    output reg  [31:0] pc_plus4_out,
    output reg  [31:0] instr_out
);
    always @(posedge clk) begin
        if (rst || flush) begin
            pc_out       <= 32'd0;
            pc_plus4_out <= 32'd0;
            instr_out    <= `INSTR_NOP;
        end else if (en) begin
            pc_out       <= pc_in;
            pc_plus4_out <= pc_plus4_in;
            instr_out    <= instr_in;
        end
    end
endmodule
