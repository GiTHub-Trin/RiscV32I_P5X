# alu_basic.s - every RV32I ALU instruction, immediates, LUI/AUIPC, li expansion
    li    x1, 10
    li    x2, -3
    add   x3, x1, x2          # 7
    sub   x4, x1, x2          # 13
    and   x5, x1, x2
    or    x6, x1, x2
    xor   x7, x1, x2
    sll   x8, x1, x1          # shamt = 10
    srl   x9, x2, x1
    sra   x10, x2, x1
    slt   x11, x2, x1         # 1
    sltu  x12, x2, x1         # 0
    addi  x13, x1, -2048
    slti  x14, x2, -2         # 1  (-3 < -2)
    sltiu x15, x2, -1         # 1  (0xFFFFFFFD < 0xFFFFFFFF)
    xori  x16, x1, 0x7ff
    ori   x17, x1, 0x5
    andi  x18, x2, 0xff
    slli  x19, x1, 31
    srli  x20, x19, 31
    srai  x21, x19, 31
    lui   x22, 0x12345
    auipc x23, 0x1
    li    x24, 0xdeadbeef
    li    x25, 0x80000000
    sub   x26, x0, x25
    addi  x0, x1, 5           # write to x0 must be ignored
    jal   x0, done
    addi  x27, x0, 99         # skipped by the jump
done:
    j     done
