// ============================================================================
// tb_if_stage.v - self-checking testbench for the Instruction Fetch stage
//
// DUT = if_stage (PC register + next-PC mux + PC+4 adder) wired to imem.
// Checks:
//   1. reset holds PC at RESET_PC
//   2. sequential fetch (PC += 4, instruction = mem[PC>>2])
//   3. pc_stall freezes the PC
//   4. redirect loads the target PC
//   5. redirect has priority over pc_stall
//   6. fetch outside the ROM returns a NOP
//   7. reset in the middle of execution returns PC to RESET_PC
//
// Inputs are driven just after a clock edge, outputs sampled 1 ns after the
// next edge (i.e. after the registered PC has updated).
// Run:  make if_test
// ============================================================================
`timescale 1ns/1ps

module tb_if_stage;
    localparam [31:0] RESET_PC = 32'h0000_0000;
    localparam [31:0] PAT      = 32'hA000_0000;   // mem[i] = PAT + i
    localparam [31:0] NOP      = 32'h0000_0013;

    reg         clk = 1'b0;
    reg         rst = 1'b1;
    reg         pc_stall = 1'b0;
    reg         redirect_valid = 1'b0;
    reg  [31:0] redirect_pc = 32'd0;

    wire [31:0] imem_addr, imem_rdata;
    wire [31:0] if_pc, if_pc_plus4, if_instr;

    integer errors = 0;
    integer i;

    always #5 clk = ~clk;

    // ---- DUT + ROM (64 words = 256 bytes) --------------------------------
    imem #(.ADDR_BITS(6)) u_imem (
        .addr (imem_addr),
        .rdata(imem_rdata)
    );

    if_stage #(.RESET_PC(RESET_PC)) dut (
        .clk           (clk),
        .rst           (rst),
        .pc_stall      (pc_stall),
        .redirect_valid(redirect_valid),
        .redirect_pc   (redirect_pc),
        .imem_addr     (imem_addr),
        .imem_rdata    (imem_rdata),
        .if_pc         (if_pc),
        .if_pc_plus4   (if_pc_plus4),
        .if_instr      (if_instr)
    );

    // ---- helpers ---------------------------------------------------------
    task tick;                       // advance one clock, settle
        begin
            @(posedge clk);
            #1;
        end
    endtask

    task check;
        input [31:0]       exp_pc;
        input [31:0]       exp_instr;
        input [8*28-1:0]   name;
        begin
            if (if_pc !== exp_pc) begin
                $display("[FAIL] %0s: pc = %08h, expected %08h (t=%0t)", name, if_pc, exp_pc, $time);
                errors = errors + 1;
            end
            if (if_instr !== exp_instr) begin
                $display("[FAIL] %0s: instr = %08h, expected %08h (t=%0t)", name, if_instr, exp_instr, $time);
                errors = errors + 1;
            end
            if (if_pc_plus4 !== exp_pc + 32'd4) begin
                $display("[FAIL] %0s: pc_plus4 = %08h, expected %08h", name, if_pc_plus4, exp_pc + 32'd4);
                errors = errors + 1;
            end
            if (imem_addr !== if_pc) begin
                $display("[FAIL] %0s: imem_addr %08h != pc %08h", name, imem_addr, if_pc);
                errors = errors + 1;
            end
        end
    endtask

    // ---- stimulus --------------------------------------------------------
    initial begin
        $dumpfile("build/tb_if_stage.vcd");
        $dumpvars(0, tb_if_stage);

        // load distinct instruction words after imem's own initial block ran
        #1;
        for (i = 0; i < 16; i = i + 1)
            u_imem.mem[i] = PAT + i;

        // 1. reset
        rst = 1'b1;
        tick; tick;
        check(RESET_PC, PAT, "reset");

        // 2. sequential fetch
        rst = 1'b0;
        for (i = 1; i <= 5; i = i + 1) begin
            tick;
            check(4*i, PAT + i, "sequential");
        end

        // 3. stall: PC must stay at 0x14 for three cycles
        pc_stall = 1'b1;
        for (i = 0; i < 3; i = i + 1) begin
            tick;
            check(32'h14, PAT + 5, "stall hold");
        end
        pc_stall = 1'b0;
        tick;
        check(32'h18, PAT + 6, "resume after stall");

        // 4. redirect (branch/jump taken in EX)
        redirect_valid = 1'b1;
        redirect_pc    = 32'h0000_0028;
        tick;
        redirect_valid = 1'b0;
        check(32'h28, PAT + 10, "redirect target");
        tick;
        check(32'h2C, PAT + 11, "after redirect");

        // 5. redirect wins over stall
        pc_stall       = 1'b1;
        redirect_valid = 1'b1;
        redirect_pc    = 32'h0000_0008;
        tick;
        redirect_valid = 1'b0;
        check(32'h08, PAT + 2, "redirect beats stall");
        tick;
        check(32'h08, PAT + 2, "stall still holds");
        pc_stall = 1'b0;
        tick;
        check(32'h0C, PAT + 3, "release stall");

        // 6. fetch outside the ROM -> NOP
        redirect_valid = 1'b1;
        redirect_pc    = 32'h0000_1000;
        tick;
        redirect_valid = 1'b0;
        check(32'h1000, NOP, "out of range");
        redirect_valid = 1'b1;
        redirect_pc    = 32'h0000_0004;
        tick;
        redirect_valid = 1'b0;
        check(32'h04, PAT + 1, "back in range");

        // 7. reset in the middle of execution
        tick; tick;
        rst = 1'b1;
        tick;
        check(RESET_PC, PAT, "mid-run reset");
        rst = 1'b0;

        // ---- summary ----------------------------------------------------
        if (errors == 0)
            $display("tb_if_stage: PASS");
        else
            $display("tb_if_stage: FAIL (%0d errors)", errors);
        $finish;
    end

    // safety net
    initial begin
        #100000;
        $display("tb_if_stage: TIMEOUT");
        $finish;
    end
endmodule
