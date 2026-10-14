// ============================================================================
// if_stage.v - Instruction Fetch
//
//   PC  --------------------------> imem_addr   (to instruction memory)
//   imem_rdata ------------------->  if_instr   (to IF/ID register)
//   PC + 4 ----------------------->  if_pc_plus4
//
// Next-PC selection (priority order):
//   1. redirect_valid : taken branch / JAL / JALR resolved in EX -> redirect_pc
//   2. pc_stall       : hold PC (load-use hazard)
//   3. otherwise      : PC + 4
//
// A redirect always wins over a stall, so the PC is written whenever
// (redirect_valid | ~pc_stall).
//
// The instruction memory is a combinational-read ROM (see memory/imem.v), so
// the instruction for 'imem_addr' is available in the same cycle.
// ============================================================================
module if_stage #(
    parameter [31:0] RESET_PC = 32'h0000_0000
) (
    input  wire        clk,
    input  wire        rst,

    // Control from hazard unit / EX stage
    input  wire        pc_stall,
    input  wire        redirect_valid,
    input  wire [31:0] redirect_pc,

    // Instruction memory interface
    output wire [31:0] imem_addr,
    input  wire [31:0] imem_rdata,

    // To IF/ID pipeline register
    output wire [31:0] if_pc,
    output wire [31:0] if_pc_plus4,
    output wire [31:0] if_instr
);
    wire [31:0] pc;
    wire [31:0] pc_next = redirect_valid ? redirect_pc : if_pc_plus4;
    wire        pc_en   = redirect_valid | ~pc_stall;

    pc_reg #(.RESET_PC(RESET_PC)) u_pc_reg (
        .clk    (clk),
        .rst    (rst),
        .en     (pc_en),
        .pc_next(pc_next),
        .pc     (pc)
    );

    assign if_pc       = pc;
    assign if_pc_plus4 = pc + 32'd4;
    assign imem_addr   = pc;
    assign if_instr    = imem_rdata;
endmodule
