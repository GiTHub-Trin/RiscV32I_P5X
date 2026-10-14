// ============================================================================
// mem_stage.v - Memory access
//   * drives the data-memory interface (word-wide with byte write strobes)
//   * store: replicates / aligns write data and builds byte enables
//   * load : selects the addressed byte/half and sign/zero-extends
//   * Accesses are assumed naturally aligned (no misalignment exceptions).
//   * fwd_data is the value this instruction will write back if it is not a
//     load (ALU result or PC+4); used by the forwarding network.
// ============================================================================
`include "riscv_defs.vh"

module mem_stage (
    // From EX/MEM register
    input  wire [31:0] alu_result,
    input  wire [31:0] store_data,
    input  wire [31:0] pc_plus4,
    input  wire [2:0]  funct3,
    input  wire [1:0]  wb_sel,
    input  wire        mem_read,
    input  wire        mem_write,

    // Data memory interface
    output wire [31:0] dmem_addr,
    output reg  [31:0] dmem_wdata,
    output reg  [3:0]  dmem_we,
    output wire        dmem_re,
    input  wire [31:0] dmem_rdata,

    // Results
    output reg  [31:0] load_data,
    output wire [31:0] fwd_data
);
    wire [1:0] off = alu_result[1:0];

    assign dmem_addr = {alu_result[31:2], 2'b00};
    assign dmem_re   = mem_read;
    assign fwd_data  = (wb_sel == `WB_PC4) ? pc_plus4 : alu_result;

    // ---- store path ------------------------------------------------------
    always @(*) begin
        dmem_wdata = store_data;
        dmem_we    = 4'b0000;
        if (mem_write) begin
            case (funct3[1:0])
                2'b00: begin                                  // SB
                    dmem_wdata = {4{store_data[7:0]}};
                    dmem_we    = 4'b0001 << off;
                end
                2'b01: begin                                  // SH
                    dmem_wdata = {2{store_data[15:0]}};
                    dmem_we    = off[1] ? 4'b1100 : 4'b0011;
                end
                default: begin                                // SW
                    dmem_wdata = store_data;
                    dmem_we    = 4'b1111;
                end
            endcase
        end
    end

    // ---- load path -------------------------------------------------------
    wire [31:0] shifted = dmem_rdata >> {off, 3'b000};

    always @(*) begin
        case (funct3)
            `F3_LB:  load_data = {{24{shifted[7]}},  shifted[7:0]};
            `F3_LH:  load_data = {{16{shifted[15]}}, shifted[15:0]};
            `F3_LBU: load_data = {24'b0, shifted[7:0]};
            `F3_LHU: load_data = {16'b0, shifted[15:0]};
            default: load_data = dmem_rdata;                  // LW
        endcase
    end
endmodule
