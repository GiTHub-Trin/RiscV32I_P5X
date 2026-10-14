# random program, seed 25
li x1, 1475092522
li x2, 1596474189
li x3, 586098746
li x4, -1049330653
li x5, -326073217
li x6, 1426962201
li x7, 536784836
li x8, 355520872
li x9, -367537632
li x10, -168605296
li x11, -1845247443
li x12, 270917124
li x31, 0
add x9, x10, x7
xori x10, x8, 1575
blt x7, x7, L0
lui x8, 38716
slti x7, x6, -1523
sb x3, 47(x31)
L0:
lbu x6, 75(x31)
auipc x10, 947793
xori x8, x7, 1624
slli x5, x1, 14
and x5, x12, x10
sll x12, x5, x3
srl x11, x12, x9
sub x10, x10, x9
auipc x3, 152982
blt x9, x5, L1
L1:
bgeu x1, x5, L2
L2:
sltiu x5, x3, 215
sltu x1, x2, x3
addi x4, x6, -1644
slti x6, x4, -1622
sw x3, 200(x31)
sub x12, x11, x9
sb x2, 38(x31)
bltu x12, x12, L3
addi x2, x2, 1892
sh x12, 136(x31)
lhu x9, 186(x31)
sub x5, x9, x9
L3:
srl x2, x2, x4
lbu x5, 99(x31)
slti x2, x8, 1187
jal x6, L4
sb x1, 82(x31)
L4:
lbu x6, 107(x31)
lui x8, 754451
blt x12, x1, L5
lb x5, 200(x31)
L5:
lui x11, 44992
xori x5, x1, -1528
slti x1, x5, 1110
addi x6, x1, -2008
beq x2, x11, L6
srli x2, x8, 27
srai x10, x9, 2
srl x7, x9, x12
L6:
jal x8, L7
L7:
add x5, x9, x5
sw x10, 28(x31)
sb x9, 114(x31)
lb x5, 67(x31)
jal x5, L8
lhu x11, 60(x31)
ori x10, x6, -1844
L8:
jal x10, L9
lb x6, 117(x31)
lb x6, 204(x31)
sh x11, 10(x31)
L9:
lw x1, 32(x31)
xori x10, x4, -873
srai x1, x9, 29
sltu x1, x8, x7
sw x7, 44(x31)
andi x5, x4, 1104
sh x1, 86(x31)
sh x10, 104(x31)
sub x2, x2, x10
xori x2, x10, 955
sll x6, x3, x9
slti x4, x10, -1410
xori x7, x11, 1975
srai x5, x8, 14
sub x12, x7, x3
srl x1, x9, x12
lbu x4, 54(x31)
sb x4, 39(x31)
sra x12, x2, x10
and x6, x2, x8
slti x9, x3, -435
sub x4, x6, x11
srai x6, x10, 2
auipc x30, 0
jalr x11, x30, 8
or x12, x12, x2
bne x5, x3, L10
sb x10, 150(x31)
and x11, x3, x9
sw x10, 152(x31)
sltu x4, x3, x6
L10:
sll x7, x7, x7
bne x2, x6, L11
L11:
sll x9, x9, x1
andi x8, x6, -1408
bltu x6, x11, L12
L12:
or x12, x5, x4
lb x2, 130(x31)
ori x10, x1, 667
sb x1, 193(x31)
andi x6, x10, -456
lh x3, 206(x31)
andi x2, x9, 512
sll x12, x6, x6
srl x7, x1, x12
lbu x10, 34(x31)
srli x5, x12, 19
lh x3, 226(x31)
srai x9, x12, 8
sb x6, 254(x31)
sb x7, 134(x31)
bgeu x10, x3, L13
L13:
jal x5, L14
lhu x1, 88(x31)
sll x8, x7, x4
sll x11, x6, x5
L14:
sra x3, x5, x5
lui x9, 29205
sub x7, x5, x7
sltiu x7, x7, 440
jal x6, L15
slt x6, x1, x3
sh x8, 28(x31)
addi x11, x9, 1481
L15:
bgeu x3, x4, L16
sra x12, x6, x12
L16:
jal x11, L17
lh x8, 222(x31)
lbu x9, 61(x31)
andi x12, x10, 56
L17:
auipc x30, 0
jalr x4, x30, 16
sb x2, 238(x31)
lui x4, 517368
beq x9, x2, L18
andi x11, x3, -1488
L18:
srli x1, x6, 21
srai x5, x11, 14
beq x7, x6, L19
lbu x1, 171(x31)
L19:
sw x2, 16(x31)
sltiu x9, x8, -362
sw x5, 148(x31)
sra x2, x9, x4
ori x8, x9, 198
bne x1, x2, L20
L20:
srli x3, x6, 16
lhu x1, 194(x31)
sltiu x3, x10, 132
sll x10, x12, x8
ori x1, x7, 1828
and x1, x11, x7
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
