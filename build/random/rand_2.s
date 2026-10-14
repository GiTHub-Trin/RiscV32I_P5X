# random program, seed 2
li x1, -1904597345
li x2, -1782961187
li x3, 1440956708
li x4, -824047624
li x5, 455026734
li x6, 458709969
li x7, 1930138874
li x8, -2029608891
li x9, -515331985
li x10, 110607312
li x11, 259890040
li x12, -1133341320
li x31, 0
bne x9, x9, L0
lbu x7, 228(x31)
lh x6, 180(x31)
L0:
sb x8, 204(x31)
sltu x8, x6, x8
ori x12, x12, 1692
xor x12, x10, x8
sw x4, 208(x31)
andi x10, x6, -1980
sub x1, x1, x4
sw x4, 68(x31)
sb x1, 216(x31)
bne x1, x2, L1
add x6, x3, x9
lhu x4, 22(x31)
L1:
jal x1, L2
L2:
lui x12, 237219
sltiu x8, x10, -1674
lw x8, 76(x31)
xor x2, x0, x3
lhu x3, 166(x31)
sltiu x10, x11, -1901
sw x3, 28(x31)
auipc x30, 0
jalr x8, x30, 8
srai x1, x4, 28
bltu x10, x5, L3
L3:
add x3, x7, x9
sub x1, x4, x1
sltiu x9, x4, -327
ori x1, x1, 1376
lui x2, 1006219
slli x10, x12, 23
sh x4, 50(x31)
lb x1, 231(x31)
slti x10, x1, 281
bgeu x0, x2, L4
srli x12, x6, 25
sh x10, 62(x31)
L4:
auipc x4, 221042
beq x8, x8, L5
xor x5, x8, x12
lhu x7, 150(x31)
sra x10, x7, x12
L5:
lui x10, 201216
bltu x7, x2, L6
sw x5, 16(x31)
L6:
lh x3, 224(x31)
or x7, x9, x9
sh x6, 120(x31)
slli x8, x1, 24
or x1, x7, x12
lhu x9, 184(x31)
lb x9, 115(x31)
andi x7, x11, -1953
srli x11, x2, 1
and x10, x4, x2
slli x5, x10, 12
lui x1, 910998
slli x8, x2, 22
bltu x11, x10, L7
andi x6, x9, 1722
sub x10, x3, x7
sll x1, x7, x11
L7:
or x8, x6, x7
sltu x8, x8, x12
xor x5, x5, x7
sw x9, 104(x31)
or x11, x1, x8
slli x2, x7, 23
sltiu x8, x8, 1572
slti x12, x11, -280
addi x4, x11, 1014
auipc x30, 0
jalr x0, x30, 12
sltu x9, x7, x12
sw x12, 164(x31)
sw x11, 148(x31)
xori x8, x6, 1562
sb x3, 161(x31)
sll x6, x12, x7
bne x10, x5, L8
slti x6, x8, -1270
sb x7, 169(x31)
L8:
slt x4, x12, x6
auipc x10, 129369
sub x7, x5, x9
and x7, x1, x8
sw x9, 44(x31)
xori x12, x7, 1114
sub x8, x3, x11
srl x5, x12, x2
add x3, x2, x11
sh x3, 122(x31)
or x9, x4, x1
srai x9, x3, 23
sub x4, x4, x10
ori x11, x12, -713
sb x4, 107(x31)
xori x3, x5, -1235
sltiu x9, x5, -172
or x11, x10, x4
addi x11, x1, 102
addi x12, x4, -865
slt x2, x12, x3
sra x11, x4, x6
or x10, x7, x1
auipc x2, 570930
srl x6, x12, x9
sh x8, 64(x31)
sh x10, 242(x31)
auipc x30, 0
jalr x8, x30, 20
sra x10, x2, x10
lui x8, 466096
lw x11, 64(x31)
sw x1, 152(x31)
auipc x30, 0
jalr x1, x30, 16
sltiu x12, x8, -1459
andi x1, x10, -968
srl x12, x10, x5
slti x3, x4, -386
sh x4, 200(x31)
srli x11, x10, 25
sra x7, x7, x4
slli x10, x11, 0
bge x5, x9, L9
xori x10, x8, -237
add x8, x11, x6
add x10, x5, x2
L9:
srai x11, x12, 8
bgeu x1, x6, L10
lb x2, 184(x31)
lui x6, 762131
lh x5, 244(x31)
slli x1, x7, 0
L10:
sw x2, 24(x31)
srli x7, x3, 10
xor x11, x1, x1
slli x7, x6, 7
sb x2, 119(x31)
beq x5, x4, L11
or x9, x7, x3
sll x8, x1, x10
sra x7, x11, x8
L11:
xor x3, x12, x3
srli x8, x4, 27
lh x7, 16(x31)
sltu x1, x9, x5
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
