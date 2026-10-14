// ============================================================================
// imem.v - instruction memory (ROM), word-addressed, combinational read
//   * 2^ADDR_BITS words; fetches outside the range return a NOP
//   * optional $readmemh image via INIT_FILE; unused words default to NOP
// ============================================================================
module imem #(
    parameter ADDR_BITS = 10,
    parameter INIT_FILE = ""
) (
    input  wire [31:0] addr,        // byte address
    output wire [31:0] rdata
);
    localparam DEPTH = 1 << ADDR_BITS;

    reg [31:0] mem [0:DEPTH-1];
    integer i;

    initial begin
        for (i = 0; i < DEPTH; i = i + 1)
            mem[i] = 32'h0000_0013;
        if (INIT_FILE != "")
            $readmemh(INIT_FILE, mem);
    end

    wire in_range = (addr[31:ADDR_BITS+2] == 0);
    assign rdata  = in_range ? mem[addr[ADDR_BITS+1:2]] : 32'h0000_0013;
endmodule
