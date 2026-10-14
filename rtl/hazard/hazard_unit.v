// ============================================================================
// hazard_unit.v - stall / flush control
//
//   Load-use  : load in EX, consumer in ID  -> freeze PC and IF/ID, insert a
//               bubble into ID/EX (1 cycle).
//   Control   : branch/jump taken in EX     -> flush IF/ID and ID/EX
//               (the two wrong-path instructions), PC <= target (2 cycles).
// ============================================================================
module hazard_unit (
    // load-use detection
    input  wire        ex_mem_read,     // instruction in EX is a load
    input  wire [4:0]  ex_rd,
    input  wire [4:0]  id_rs1,
    input  wire [4:0]  id_rs2,
    input  wire        id_uses_rs1,
    input  wire        id_uses_rs2,

    // control hazard
    input  wire        ex_redirect,

    output wire        pc_stall,
    output wire        if_id_en,
    output wire        if_id_flush,
    output wire        id_ex_flush
);
    wire load_use = ex_mem_read && (ex_rd != 5'd0) &&
                    ((id_uses_rs1 && (ex_rd == id_rs1)) ||
                     (id_uses_rs2 && (ex_rd == id_rs2)));

    assign pc_stall    = load_use;
    assign if_id_en    = ~load_use;
    assign if_id_flush = ex_redirect;
    assign id_ex_flush = ex_redirect | load_use;
endmodule
