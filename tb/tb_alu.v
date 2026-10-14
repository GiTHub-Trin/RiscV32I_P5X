// ============================================================================
// tb_alu.v - self-checking ALU test (directed corner cases + random vectors
//            compared with a behavioural reference computed in the testbench)
// ============================================================================
`timescale 1ns/1ps
`include "riscv_defs.vh"

module tb_alu;
    reg  [31:0] a, b;
    reg  [3:0]  op;
    wire [31:0] y;
    integer errors = 0;
    integer n;

    alu dut (.a(a), .b(b), .alu_ctrl(op), .result(y));

    function [31:0] ref_alu;
        input [31:0] fa, fb;
        input [3:0]  fop;
        reg signed [31:0] sa, sb;
        begin
            sa = fa; sb = fb;
            case (fop)
                `ALU_ADD:  ref_alu = fa + fb;
                `ALU_SUB:  ref_alu = fa - fb;
                `ALU_SLL:  ref_alu = fa << fb[4:0];
                `ALU_SLT:  ref_alu = (sa < sb) ? 32'd1 : 32'd0;
                `ALU_SLTU: ref_alu = (fa < fb) ? 32'd1 : 32'd0;
                `ALU_XOR:  ref_alu = fa ^ fb;
                `ALU_SRL:  ref_alu = fa >> fb[4:0];
                `ALU_SRA:  ref_alu = sa >>> fb[4:0];
                `ALU_OR:   ref_alu = fa | fb;
                `ALU_AND:  ref_alu = fa & fb;
                default:   ref_alu = 32'd0;
            endcase
        end
    endfunction

    task apply;
        input [31:0] ta, tb_;
        input [3:0]  top;
        reg   [31:0] expv;
        begin
            a = ta; b = tb_; op = top;
            #1;
            expv = ref_alu(ta, tb_, top);
            if (y !== expv) begin
                $display("[FAIL] op=%0d a=%08h b=%08h -> %08h, expected %08h", top, ta, tb_, y, expv);
                errors = errors + 1;
            end
        end
    endtask

    integer o;
    initial begin
        // directed corner cases
        for (o = 0; o < 10; o = o + 1) begin
            apply(32'h0000_0000, 32'h0000_0000, o[3:0]);
            apply(32'hFFFF_FFFF, 32'h0000_0001, o[3:0]);
            apply(32'h8000_0000, 32'h0000_001F, o[3:0]);
            apply(32'h7FFF_FFFF, 32'hFFFF_FFFF, o[3:0]);
            apply(32'h8000_0000, 32'h7FFF_FFFF, o[3:0]);
            apply(32'hDEAD_BEEF, 32'h0000_0004, o[3:0]);
        end
        // random vectors
        for (n = 0; n < 2000; n = n + 1)
            apply($random, $random, n % 10);

        if (errors == 0) $display("tb_alu: PASS");
        else             $display("tb_alu: FAIL (%0d errors)", errors);
        $finish;
    end
endmodule
