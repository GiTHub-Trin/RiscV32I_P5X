// ============================================================================
// riscv_soc.v - simulation/FPGA top: core + instruction ROM + data RAM
// ============================================================================
module riscv_soc #(
    parameter IMEM_ADDR_BITS = 10,           // 4 KiB
    parameter DMEM_ADDR_BITS = 10,           // 4 KiB
    parameter IMEM_INIT      = "",
    parameter DMEM_INIT      = ""
) (
    input wire clk,
    input wire rst
);
    wire [31:0] imem_addr, imem_rdata;
    wire [31:0] dmem_addr, dmem_wdata, dmem_rdata;
    wire [3:0]  dmem_we;
    wire        dmem_re;

    riscv_core u_core (
        .clk       (clk),
        .rst       (rst),
        .imem_addr (imem_addr),
        .imem_rdata(imem_rdata),
        .dmem_addr (dmem_addr),
        .dmem_wdata(dmem_wdata),
        .dmem_we   (dmem_we),
        .dmem_re   (dmem_re),
        .dmem_rdata(dmem_rdata)
    );

    imem #(.ADDR_BITS(IMEM_ADDR_BITS), .INIT_FILE(IMEM_INIT)) u_imem (
        .addr (imem_addr),
        .rdata(imem_rdata)
    );

    dmem #(.ADDR_BITS(DMEM_ADDR_BITS), .INIT_FILE(DMEM_INIT)) u_dmem (
        .clk  (clk),
        .we   (dmem_we),
        .re   (dmem_re),
        .addr (dmem_addr),
        .wdata(dmem_wdata),
        .rdata(dmem_rdata)
    );
endmodule
