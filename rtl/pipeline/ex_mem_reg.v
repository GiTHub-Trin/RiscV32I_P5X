// ============================================================================
// ex_mem_reg.v - EX/MEM pipeline register
// ============================================================================
module ex_mem_reg (
    input  wire        clk,
    input  wire        rst,

    input  wire [31:0] pc_plus4_in,
    input  wire [31:0] alu_result_in,
    input  wire [31:0] store_data_in,
    input  wire [4:0]  rd_in,
    input  wire [2:0]  funct3_in,
    input  wire        reg_write_in,
    input  wire [1:0]  wb_sel_in,
    input  wire        mem_read_in,
    input  wire        mem_write_in,

    output reg  [31:0] pc_plus4_out,
    output reg  [31:0] alu_result_out,
    output reg  [31:0] store_data_out,
    output reg  [4:0]  rd_out,
    output reg  [2:0]  funct3_out,
    output reg         reg_write_out,
    output reg  [1:0]  wb_sel_out,
    output reg         mem_read_out,
    output reg         mem_write_out
);
    always @(posedge clk) begin
        if (rst) begin
            pc_plus4_out   <= 32'd0;
            alu_result_out <= 32'd0;
            store_data_out <= 32'd0;
            rd_out         <= 5'd0;
            funct3_out     <= 3'd0;
            reg_write_out  <= 1'b0;
            wb_sel_out     <= 2'd0;
            mem_read_out   <= 1'b0;
            mem_write_out  <= 1'b0;
        end else begin
            pc_plus4_out   <= pc_plus4_in;
            alu_result_out <= alu_result_in;
            store_data_out <= store_data_in;
            rd_out         <= rd_in;
            funct3_out     <= funct3_in;
            reg_write_out  <= reg_write_in;
            wb_sel_out     <= wb_sel_in;
            mem_read_out   <= mem_read_in;
            mem_write_out  <= mem_write_in;
        end
    end
endmodule
