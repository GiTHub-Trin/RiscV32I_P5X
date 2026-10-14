// ============================================================================
// mem_wb_reg.v - MEM/WB pipeline register
// ============================================================================
module mem_wb_reg (
    input  wire        clk,
    input  wire        rst,

    input  wire [31:0] pc_plus4_in,
    input  wire [31:0] alu_result_in,
    input  wire [31:0] load_data_in,
    input  wire [4:0]  rd_in,
    input  wire        reg_write_in,
    input  wire [1:0]  wb_sel_in,

    output reg  [31:0] pc_plus4_out,
    output reg  [31:0] alu_result_out,
    output reg  [31:0] load_data_out,
    output reg  [4:0]  rd_out,
    output reg         reg_write_out,
    output reg  [1:0]  wb_sel_out
);
    always @(posedge clk) begin
        if (rst) begin
            pc_plus4_out   <= 32'd0;
            alu_result_out <= 32'd0;
            load_data_out  <= 32'd0;
            rd_out         <= 5'd0;
            reg_write_out  <= 1'b0;
            wb_sel_out     <= 2'd0;
        end else begin
            pc_plus4_out   <= pc_plus4_in;
            alu_result_out <= alu_result_in;
            load_data_out  <= load_data_in;
            rd_out         <= rd_in;
            reg_write_out  <= reg_write_in;
            wb_sel_out     <= wb_sel_in;
        end
    end
endmodule
