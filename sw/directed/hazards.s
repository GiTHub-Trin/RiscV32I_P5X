# hazards.s - forwarding, load-use stall, branches (taken / not taken), JAL/JALR
    li    x1, 1
    add   x2, x1, x1          # EX/MEM forward of x1 chain
    add   x3, x2, x1          # x2 from EX/MEM, x1 from MEM/WB
    add   x4, x3, x2
    add   x5, x4, x3          # back-to-back dependencies
    add   x6, x5, x5          # both operands from EX/MEM
    sw    x6, 0(x0)
    lw    x7, 0(x0)
    addi  x8, x7, 1           # load-use stall
    lw    x9, 0(x0)
    sw    x9, 4(x0)           # load -> store-data dependency
    lw    x10, 4(x0)
    add   x11, x10, x10       # load-use on both operands
    lw    x12, 0(x0)
    nop
    add   x13, x12, x1        # load followed by one independent instr
    # ---- loop: bne taken 4 times, then falls through
    li    x14, 0
    li    x15, 5
loop:
    addi  x14, x14, 1
    bne   x14, x15, loop
    beq   x14, x15, skip1     # taken
    li    x16, 111            # must be flushed
skip1:
    blt   x0, x14, t1         # taken (0 < 5)
    li    x17, 222            # must be flushed
t1:
    bge   x0, x14, t2         # not taken
    li    x18, 7
t2:
    bltu  x14, x15, t3        # 5 < 5 false -> not taken
    li    x19, 8
t3:
    bgeu  x14, x15, t4        # taken
    li    x20, 333            # must be flushed
t4:
    # ---- load feeding a branch
    li    x21, 5
    sw    x21, 8(x0)
    lw    x22, 8(x0)
    beq   x22, x15, t5        # load-use stall then taken
    li    x23, 444            # must be flushed
t5:
    # ---- JAL / JALR with link-register forwarding
    jal   x1, func
    addi  x24, x24, 1         # executed once after return
    jal   x5, next            # link value consumed immediately
next:
    add   x25, x5, x5
    auipc x30, 0
    jalr  x26, x30, 12        # jump over the next instruction, x26 = pc+4
    li    x27, 555            # must be skipped
    li    x28, 6
    j     end
func:
    addi  x29, x0, 42
    jalr  x0, x1, 0           # return
end:
    j     end
