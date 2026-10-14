// ============================================================================
// pc_reg.v - Program Counter register
//   * synchronous active-high reset to RESET_PC
//   * 'en' gates the update so the PC can be frozen on a load-use stall
// ============================================================================
module pc_reg #(
    parameter [31:0] RESET_PC = 32'h0000_0000
) (
    input  wire        clk,
    input  wire        rst,
    input  wire        en,
    input  wire [31:0] pc_next,
    output reg  [31:0] pc
);
    always @(posedge clk) begin
        if (rst)
            pc <= RESET_PC;
        else if (en)
            pc <= pc_next;
    end
endmodule
