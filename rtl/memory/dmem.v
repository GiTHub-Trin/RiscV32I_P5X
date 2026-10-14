// ============================================================================
// dmem.v - data memory, 32-bit words with per-byte write enables
//   * synchronous write, combinational read (classic 5-stage assumption)
//   * out-of-range reads return 0, out-of-range writes are ignored
// ============================================================================
module dmem #(
    parameter ADDR_BITS = 10,
    parameter INIT_FILE = ""
) (
    input  wire        clk,
    input  wire [3:0]  we,          // byte write enables
    input  wire        re,          // unused by this model (kept for interface)
    input  wire [31:0] addr,        // byte address (word aligned by MEM stage)
    input  wire [31:0] wdata,
    output wire [31:0] rdata
);
    localparam DEPTH = 1 << ADDR_BITS;

    reg [31:0] mem [0:DEPTH-1];
    reg [31:0] tmp;
    integer i;

    initial begin
        for (i = 0; i < DEPTH; i = i + 1)
            mem[i] = 32'h0;
        if (INIT_FILE != "")
            $readmemh(INIT_FILE, mem);
    end

    wire                 in_range = (addr[31:ADDR_BITS+2] == 0);
    wire [ADDR_BITS-1:0] idx      = addr[ADDR_BITS+1:2];

    always @(posedge clk) begin
        if (in_range && (|we)) begin
            tmp = mem[idx];
            if (we[0]) tmp[7:0]   = wdata[7:0];
            if (we[1]) tmp[15:8]  = wdata[15:8];
            if (we[2]) tmp[23:16] = wdata[23:16];
            if (we[3]) tmp[31:24] = wdata[31:24];
            mem[idx] <= tmp;
        end
    end

    assign rdata = in_range ? mem[idx] : 32'h0;
endmodule
