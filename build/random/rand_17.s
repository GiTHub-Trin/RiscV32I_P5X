# random program, seed 17
li x1, 94420161
li x2, 1317226848
li x3, 1977810007
li x4, -903552102
li x5, 693134957
li x6, -2031791066
li x7, 1058259313
li x8, -422663686
li x9, -1880367624
li x10, 1611972096
li x11, -1245497532
li x12, 171641309
li x31, 0
auipc x5, 859149
bgeu x3, x7, L0
lh x7, 8(x31)
addi x12, x8, 1022
lui x1, 850306
L0:
slli x9, x1, 17
bne x9, x3, L1
sltu x6, x6, x10
srli x6, x0, 22
L1:
bge x12, x5, L2
sra x1, x9, x7
ori x7, x5, -813
L2:
sb x6, 156(x31)
srl x2, x5, x11
ori x2, x4, -206
sll x5, x8, x8
andi x8, x8, -257
slti x6, x12, 1414
bltu x9, x6, L3
slti x5, x8, -1283
srai x1, x10, 11
L3:
ori x3, x8, 1661
bne x8, x6, L4
sltu x2, x12, x2
sltiu x10, x2, -1834
L4:
sb x2, 15(x31)
or x1, x9, x6
srli x7, x9, 21
bgeu x5, x2, L5
L5:
slli x8, x8, 7
srl x5, x8, x4
sw x2, 76(x31)
srli x9, x3, 9
auipc x30, 0
jalr x8, x30, 16
lh x2, 208(x31)
lui x3, 316517
sltiu x9, x9, -996
sltu x9, x1, x6
ori x7, x2, 382
bge x3, x5, L6
sltiu x10, x3, 1525
sltu x4, x9, x12
L6:
sub x5, x11, x6
bltu x11, x7, L7
sltiu x12, x3, 1350
slt x6, x12, x4
lhu x8, 36(x31)
auipc x6, 262241
L7:
xori x11, x4, 1523
srl x7, x12, x6
sb x2, 252(x31)
sh x3, 50(x31)
sll x4, x3, x2
sltu x10, x9, x7
lb x12, 15(x31)
slli x12, x5, 22
sw x6, 52(x31)
xori x6, x1, -1118
lhu x10, 58(x31)
srl x2, x8, x4
andi x5, x10, -1178
slt x5, x5, x6
xori x1, x2, 625
xori x1, x2, 1786
sw x2, 76(x31)
lbu x5, 102(x31)
lb x1, 195(x31)
andi x5, x10, 1268
lbu x4, 169(x31)
slti x10, x4, 1784
xori x10, x2, -6
blt x6, x7, L8
L8:
srai x1, x9, 20
andi x3, x6, 549
sw x2, 224(x31)
jal x8, L9
srai x8, x1, 0
L9:
auipc x30, 0
jalr x11, x30, 20
lb x4, 143(x31)
add x10, x8, x8
srl x12, x12, x8
slt x8, x2, x12
sltiu x9, x8, 144
sb x6, 109(x31)
bne x6, x9, L10
L10:
auipc x30, 0
jalr x8, x30, 8
sra x7, x9, x10
sb x3, 45(x31)
lui x7, 71623
jal x3, L11
lbu x6, 174(x31)
ori x8, x5, 1349
L11:
srli x5, x5, 3
lh x6, 68(x31)
beq x10, x4, L12
sb x10, 189(x31)
slti x8, x8, -265
L12:
lhu x4, 14(x31)
sb x4, 37(x31)
lui x9, 365240
xor x5, x12, x5
andi x1, x3, 1283
slti x11, x8, 279
jal x5, L13
srai x5, x1, 15
sub x7, x7, x12
L13:
sb x9, 135(x31)
sb x11, 2(x31)
and x12, x3, x1
addi x10, x6, -1770
auipc x30, 0
jalr x9, x30, 16
lw x6, 4(x31)
sltiu x12, x12, 246
sw x4, 192(x31)
and x12, x8, x11
sll x2, x4, x6
add x2, x9, x12
xor x8, x9, x7
lui x1, 243629
bltu x4, x10, L14
lui x7, 249979
sw x3, 108(x31)
L14:
sw x5, 72(x31)
sra x5, x7, x6
sw x5, 124(x31)
sh x7, 84(x31)
sltiu x1, x9, 881
sh x9, 238(x31)
lui x3, 458008
bltu x6, x6, L15
srli x1, x4, 13
sb x11, 216(x31)
L15:
or x3, x1, x6
andi x11, x12, 47
sltiu x6, x6, -850
addi x3, x11, -1612
srli x9, x12, 10
lui x6, 744170
srl x8, x3, x11
sub x3, x1, x10
slti x1, x1, -879
slti x6, x12, -1797
sw x3, 64(x31)
addi x9, x11, 705
sb x8, 142(x31)
lbu x4, 108(x31)
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
