// ============================================================================
// tb_regfile.v - register file: x0 = 0, write/read, write-through bypass
// ============================================================================
`timescale 1ns/1ps

module tb_regfile;
    reg         clk = 0;
    reg         we = 0;
    reg  [4:0]  waddr = 0, ra1 = 0, ra2 = 0;
    reg  [31:0] wdata = 0;
    wire [31:0] rd1, rd2;
    integer errors = 0;
    integer i;

    always #5 clk = ~clk;

    regfile dut (.clk(clk), .we(we), .waddr(waddr), .wdata(wdata),
                 .raddr1(ra1), .raddr2(ra2), .rdata1(rd1), .rdata2(rd2));

    task expect_eq;
        input [31:0] got, expv;
        input [8*24-1:0] name;
        begin
            if (got !== expv) begin
                $display("[FAIL] %0s: got %08h expected %08h", name, got, expv);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        // write every register with a unique value (x0 write must be ignored)
        for (i = 0; i < 32; i = i + 1) begin
            @(negedge clk);
            we = 1; waddr = i; wdata = 32'h1000_0000 + i;
        end
        @(negedge clk);
        we = 0;

        // read back
        for (i = 0; i < 32; i = i + 1) begin
            ra1 = i; ra2 = 31 - i; #1;
            expect_eq(rd1, (i == 0)      ? 32'h0 : 32'h1000_0000 + i,        "port1 readback");
            expect_eq(rd2, (31 - i == 0) ? 32'h0 : 32'h1000_0000 + (31 - i), "port2 readback");
        end

        // write-through bypass: same-cycle write visible on read ports
        @(negedge clk);
        we = 1; waddr = 5'd7; wdata = 32'hCAFE_F00D; ra1 = 5'd7; ra2 = 5'd7; #1;
        expect_eq(rd1, 32'hCAFE_F00D, "bypass port1");
        expect_eq(rd2, 32'hCAFE_F00D, "bypass port2");

        // bypass must not apply to x0
        waddr = 5'd0; wdata = 32'hFFFF_FFFF; ra1 = 5'd0; #1;
        expect_eq(rd1, 32'h0, "x0 stays zero");

        @(negedge clk); we = 0;

        if (errors == 0) $display("tb_regfile: PASS");
        else             $display("tb_regfile: FAIL (%0d errors)", errors);
        $finish;
    end
endmodule
