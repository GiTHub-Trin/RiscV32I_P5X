# random program, seed 22
li x1, -1544605122
li x2, 2141602361
li x3, 1673108568
li x4, -1152161526
li x5, 1973473326
li x6, 434402832
li x7, 1820418307
li x8, 1637960475
li x9, 384639318
li x10, -813118041
li x11, -1330869418
li x12, 1502415980
li x31, 0
sw x10, 28(x31)
srl x5, x11, x5
auipc x3, 905780
beq x5, x9, L0
sh x6, 94(x31)
addi x5, x9, 1503
lw x2, 216(x31)
sra x6, x7, x4
L0:
addi x8, x3, -1801
sltiu x6, x8, -1746
bgeu x11, x1, L1
sub x3, x8, x2
L1:
srai x5, x12, 30
xor x2, x10, x2
blt x6, x11, L2
lhu x3, 136(x31)
slt x6, x4, x8
sb x2, 11(x31)
lui x10, 435606
L2:
or x3, x7, x10
bge x1, x12, L3
sltiu x4, x2, 133
L3:
sw x11, 80(x31)
sll x10, x8, x5
sra x11, x9, x6
sw x10, 4(x31)
and x9, x5, x9
or x3, x9, x8
sb x2, 255(x31)
auipc x4, 339212
blt x9, x3, L4
xor x10, x6, x1
or x11, x11, x2
slli x5, x6, 26
L4:
srai x6, x11, 3
lh x1, 144(x31)
xor x5, x6, x8
sb x7, 244(x31)
lh x9, 120(x31)
lui x6, 84912
or x4, x4, x9
jal x5, L5
L5:
sb x3, 246(x31)
xor x4, x11, x8
srli x11, x11, 28
add x2, x8, x2
andi x5, x1, -725
slti x10, x6, 1213
lhu x9, 230(x31)
slti x4, x9, 167
srai x4, x4, 22
lb x6, 116(x31)
sll x1, x9, x2
jal x7, L6
xor x9, x5, x3
L6:
lbu x3, 247(x31)
sub x5, x8, x12
bgeu x8, x6, L7
lw x4, 164(x31)
sw x6, 24(x31)
or x9, x7, x6
sw x7, 48(x31)
L7:
srai x9, x12, 20
slli x12, x2, 10
lb x11, 231(x31)
and x1, x7, x2
lbu x11, 144(x31)
bne x3, x3, L8
sub x4, x11, x11
and x11, x5, x2
slli x3, x7, 9
L8:
blt x1, x8, L9
srai x8, x4, 9
lb x8, 14(x31)
L9:
bne x4, x7, L10
sltu x11, x10, x7
xor x3, x2, x4
L10:
lh x10, 140(x31)
bgeu x4, x4, L11
xor x5, x2, x4
sw x5, 248(x31)
L11:
beq x1, x1, L12
lw x8, 248(x31)
andi x3, x4, -617
addi x6, x1, 1575
L12:
srai x6, x3, 17
lb x10, 32(x31)
or x7, x6, x9
bge x6, x4, L13
L13:
sltu x1, x7, x5
lh x6, 172(x31)
xor x6, x7, x3
lhu x4, 80(x31)
srl x11, x6, x11
srli x2, x8, 7
lbu x9, 225(x31)
ori x7, x4, 1852
sw x12, 244(x31)
add x12, x12, x1
sh x7, 4(x31)
srl x3, x6, x9
addi x2, x7, -979
lw x10, 36(x31)
sh x6, 18(x31)
auipc x30, 0
jalr x12, x30, 8
bgeu x4, x3, L14
L14:
lbu x10, 49(x31)
auipc x30, 0
jalr x3, x30, 16
xor x1, x6, x5
xori x11, x5, -187
bgeu x3, x10, L15
auipc x3, 846572
andi x12, x9, -1288
L15:
or x8, x5, x9
and x9, x12, x4
lhu x5, 156(x31)
sw x9, 136(x31)
sll x5, x7, x1
bltu x8, x2, L16
lh x12, 154(x31)
srai x11, x4, 13
sb x2, 249(x31)
lui x10, 900033
L16:
addi x4, x12, 1247
andi x5, x12, -149
sra x2, x7, x8
lb x7, 129(x31)
slli x2, x4, 20
sb x4, 219(x31)
sltiu x12, x4, 1868
auipc x30, 0
jalr x1, x30, 16
sll x1, x9, x9
sub x7, x7, x8
addi x7, x12, -745
or x5, x9, x11
sra x1, x12, x5
or x8, x1, x3
auipc x30, 0
jalr x1, x30, 12
xor x1, x6, x12
sra x4, x12, x2
jal x0, L17
or x1, x9, x4
sw x11, 32(x31)
L17:
sb x6, 79(x31)
sw x1, 44(x31)
bge x1, x11, L18
L18:
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
