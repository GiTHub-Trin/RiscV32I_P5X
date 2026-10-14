// ============================================================================
// tb_riscv_core.v - whole-CPU testbench (golden-model comparison)
//
//   +HEX=<file>     program image (one 32-bit hex word per line)
//   +EXP=<file>     expected final x0..x31 (32 hex words), produced by
//                   tools/rvsim.py (Python RV32I reference simulator)
//   +CYCLES=<n>     number of clock cycles to run (default 3000)
//
// Programs end in `j .` so after the program finishes the architectural state
// no longer changes; we simply run long enough and compare the register file.
// ============================================================================
`timescale 1ns/1ps

module tb_riscv_core;
    reg clk = 1'b0;
    reg rst = 1'b1;

    riscv_soc dut (.clk(clk), .rst(rst));

    always #5 clk = ~clk;

    reg [8*256-1:0] hexfile, expfile;
    reg [31:0]      expected [0:31];
    integer         cycles, i, errors;

    initial begin
        $dumpfile("build/tb_riscv_core.vcd");
        $dumpvars(0, tb_riscv_core);

        if (!$value$plusargs("HEX=%s", hexfile)) begin
            $display("tb_riscv_core: ERROR - need +HEX=<file>");
            $finish;
        end
        if (!$value$plusargs("EXP=%s", expfile)) begin
            $display("tb_riscv_core: ERROR - need +EXP=<file>");
            $finish;
        end
        if (!$value$plusargs("CYCLES=%d", cycles))
            cycles = 3000;

        #1;
        $readmemh(hexfile, dut.u_imem.mem);
        $readmemh(expfile, expected);

        repeat (3) @(posedge clk);
        #1 rst = 1'b0;

        repeat (cycles) @(posedge clk);
        #1;

        errors = 0;
        for (i = 0; i < 32; i = i + 1) begin
            if (dut.u_core.u_id.u_regfile.regs[i] !== expected[i]) begin
                $display("[FAIL] x%0d = %08h, expected %08h",
                         i, dut.u_core.u_id.u_regfile.regs[i], expected[i]);
                errors = errors + 1;
            end
        end

        if (errors == 0) $display("tb_riscv_core: PASS (%0s)", hexfile);
        else             $display("tb_riscv_core: FAIL (%0s, %0d mismatches)", hexfile, errors);
        $finish;
    end
endmodule
