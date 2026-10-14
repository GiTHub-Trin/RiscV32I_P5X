# random program, seed 10
li x1, 306671827
li x2, -305419184
li x3, 335399608
li x4, -1262298496
li x5, 1345704537
li x6, 1389803639
li x7, -1459302929
li x8, 88774231
li x9, -739710141
li x10, 2132696047
li x11, -1956115428
li x12, 1546879875
li x31, 0
sltiu x11, x3, 435
slt x8, x1, x4
jal x9, L0
slti x6, x8, 1523
andi x10, x9, -767
L0:
sb x5, 18(x31)
auipc x9, 169763
jal x10, L1
sub x8, x4, x7
sh x3, 124(x31)
L1:
sub x5, x3, x3
sltiu x6, x1, -1691
addi x5, x10, -752
sw x5, 120(x31)
lui x2, 348775
xori x3, x10, 812
slti x9, x7, -1759
addi x1, x3, -1158
sh x7, 70(x31)
sh x12, 132(x31)
ori x9, x4, 598
lw x1, 244(x31)
sh x2, 126(x31)
beq x5, x8, L2
and x7, x4, x3
slt x7, x2, x5
sh x12, 216(x31)
srli x10, x11, 0
L2:
lui x7, 418886
beq x6, x8, L3
slti x11, x8, 360
srai x5, x11, 21
sltiu x8, x8, 1883
L3:
bgeu x12, x3, L4
sh x12, 32(x31)
sb x2, 167(x31)
lw x5, 188(x31)
lui x4, 353433
L4:
slli x4, x2, 26
auipc x30, 0
jalr x0, x30, 20
sb x10, 200(x31)
and x6, x11, x1
xor x7, x11, x3
bne x9, x6, L5
sra x10, x1, x8
lw x12, 228(x31)
L5:
lui x6, 888310
ori x9, x4, -1254
sll x11, x10, x6
sw x4, 24(x31)
beq x6, x5, L6
sb x7, 202(x31)
L6:
bge x7, x8, L7
sh x3, 18(x31)
L7:
ori x11, x7, -1276
lbu x7, 54(x31)
sltiu x9, x2, 783
srli x10, x5, 0
sh x11, 116(x31)
srl x10, x6, x4
slli x2, x1, 1
slti x12, x6, 1852
slt x3, x4, x4
srai x7, x1, 8
beq x3, x7, L8
L8:
bgeu x10, x1, L9
slli x12, x8, 29
addi x7, x8, 938
auipc x3, 556402
L9:
add x3, x9, x2
and x6, x10, x9
srai x1, x10, 3
slli x3, x12, 26
jal x6, L10
L10:
lhu x8, 152(x31)
sll x1, x3, x12
lh x3, 240(x31)
bge x12, x4, L11
sltiu x11, x9, 1061
xor x12, x3, x1
lw x7, 24(x31)
lui x2, 75332
L11:
jal x6, L12
L12:
auipc x10, 189988
bge x3, x11, L13
andi x9, x12, -70
lhu x9, 110(x31)
L13:
lhu x2, 96(x31)
lw x2, 64(x31)
slti x1, x11, -649
auipc x4, 700369
add x8, x6, x11
sw x5, 24(x31)
sb x2, 214(x31)
jal x0, L14
srl x9, x1, x12
L14:
slli x7, x7, 30
addi x8, x11, 1991
sll x8, x8, x8
sw x1, 228(x31)
andi x8, x4, -221
add x9, x1, x7
slti x1, x6, -1697
sll x11, x6, x11
sll x5, x11, x4
blt x9, x12, L15
sltiu x7, x8, 898
xori x8, x3, -484
srli x5, x12, 27
L15:
sll x3, x6, x7
sw x1, 36(x31)
sh x12, 42(x31)
lui x12, 181076
auipc x3, 942195
lbu x12, 216(x31)
slti x12, x6, 1894
slt x10, x12, x11
lbu x12, 40(x31)
lb x12, 116(x31)
srli x6, x10, 11
xori x7, x2, 1407
lbu x2, 30(x31)
sltu x12, x5, x3
sw x1, 64(x31)
addi x7, x10, -1860
auipc x30, 0
jalr x7, x30, 12
sra x2, x6, x5
auipc x1, 926413
sb x9, 27(x31)
srai x10, x6, 18
sltiu x6, x5, 350
lw x5, 52(x31)
xori x7, x2, -817
lui x1, 931292
lh x5, 220(x31)
jal x11, L16
auipc x3, 104924
L16:
bne x9, x10, L17
sra x6, x5, x11
sh x12, 34(x31)
srli x9, x10, 17
srli x1, x7, 21
L17:
lh x8, 170(x31)
sw x6, 248(x31)
lui x11, 986270
lbu x7, 198(x31)
xor x2, x5, x3
lb x11, 147(x31)
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
