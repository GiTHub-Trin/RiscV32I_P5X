// ============================================================================
// forwarding_unit.v - EX-stage operand forwarding
//   Priority: EX/MEM (youngest producer) over MEM/WB.
//   Loads are never forwarded from EX/MEM: the hazard unit stalls the
//   consumer one cycle so the data is picked up from MEM/WB instead.
// ============================================================================
`include "riscv_defs.vh"

module forwarding_unit (
    input  wire [4:0] ex_rs1,
    input  wire [4:0] ex_rs2,
    input  wire [4:0] mem_rd,
    input  wire       mem_reg_write,
    input  wire [4:0] wb_rd,
    input  wire       wb_reg_write,
    output reg  [1:0] fwd_a,
    output reg  [1:0] fwd_b
);
    always @(*) begin
        fwd_a = `FWD_NONE;
        fwd_b = `FWD_NONE;

        // older producer first, younger one overrides
        if (wb_reg_write  && wb_rd  != 5'd0 && wb_rd  == ex_rs1) fwd_a = `FWD_WB;
        if (wb_reg_write  && wb_rd  != 5'd0 && wb_rd  == ex_rs2) fwd_b = `FWD_WB;
        if (mem_reg_write && mem_rd != 5'd0 && mem_rd == ex_rs1) fwd_a = `FWD_MEM;
        if (mem_reg_write && mem_rd != 5'd0 && mem_rd == ex_rs2) fwd_b = `FWD_MEM;
    end
endmodule
