# random program, seed 20
li x1, 1737813524
li x2, 1739228534
li x3, 1598287794
li x4, -1420010287
li x5, -380005548
li x6, 2121018115
li x7, -1704037703
li x8, -776791444
li x9, -217322084
li x10, -1251327662
li x11, -706226562
li x12, -311935752
li x31, 0
lhu x2, 206(x31)
slt x2, x5, x5
and x2, x5, x4
and x5, x12, x10
sw x7, 140(x31)
jal x12, L0
sw x10, 64(x31)
slti x2, x1, -464
slti x2, x5, -2032
L0:
lhu x9, 234(x31)
lbu x8, 60(x31)
and x12, x6, x2
lb x4, 13(x31)
slli x3, x11, 8
sh x2, 140(x31)
slt x2, x9, x3
addi x3, x11, 502
sh x5, 104(x31)
jal x1, L1
L1:
sh x8, 144(x31)
sra x4, x1, x9
bltu x12, x5, L2
sub x1, x1, x4
lui x7, 164015
lui x6, 593406
andi x3, x7, 1206
L2:
sra x2, x8, x4
sh x1, 194(x31)
sw x2, 188(x31)
srli x12, x11, 23
slt x7, x4, x7
sh x2, 150(x31)
sll x8, x4, x6
andi x9, x12, -1039
auipc x9, 397362
or x12, x8, x3
jal x10, L3
L3:
sll x6, x11, x3
sltu x2, x9, x8
sw x3, 48(x31)
ori x7, x3, 1684
sw x3, 244(x31)
auipc x30, 0
jalr x2, x30, 16
srl x8, x0, x5
auipc x2, 455951
sb x4, 156(x31)
sh x4, 48(x31)
sw x3, 188(x31)
bne x12, x2, L4
or x9, x5, x10
sw x11, 96(x31)
xori x12, x11, -612
L4:
sb x10, 254(x31)
slt x5, x2, x12
sltiu x4, x3, -1589
srli x1, x6, 16
sh x6, 32(x31)
bgeu x3, x11, L5
sra x7, x1, x4
ori x8, x8, 376
xori x4, x11, -1073
lh x11, 94(x31)
L5:
add x2, x4, x9
sltiu x10, x10, -972
sb x9, 5(x31)
slti x4, x6, -1013
jal x0, L6
or x5, x4, x2
and x3, x6, x6
L6:
sh x6, 12(x31)
lhu x1, 158(x31)
beq x5, x8, L7
L7:
srl x12, x7, x5
sw x1, 32(x31)
lhu x2, 220(x31)
add x11, x10, x11
sb x6, 231(x31)
lb x4, 33(x31)
sra x8, x1, x11
sll x10, x4, x10
slt x5, x6, x12
lui x12, 658833
sltu x10, x12, x5
and x12, x10, x9
auipc x30, 0
jalr x5, x30, 12
add x9, x0, x2
sh x1, 116(x31)
xor x5, x8, x2
slt x12, x11, x8
sb x8, 12(x31)
lui x9, 99892
sub x9, x4, x1
jal x4, L8
L8:
xor x4, x12, x5
slt x7, x11, x12
bgeu x7, x6, L9
sub x10, x3, x2
L9:
lb x12, 69(x31)
lui x1, 442698
beq x3, x7, L10
sltu x9, x1, x2
L10:
ori x2, x12, -236
lw x6, 124(x31)
beq x1, x9, L11
sh x11, 86(x31)
addi x4, x5, 1829
auipc x5, 214587
slti x11, x10, -231
L11:
slt x7, x2, x8
ori x9, x3, -1338
sra x11, x9, x12
slli x2, x2, 5
slti x1, x4, -977
blt x9, x3, L12
lhu x3, 94(x31)
L12:
sub x9, x8, x12
xori x2, x1, 1565
or x8, x4, x12
slti x12, x3, 827
bltu x11, x6, L13
sw x11, 132(x31)
srli x8, x10, 0
sra x10, x9, x9
sb x0, 201(x31)
L13:
slti x11, x8, -1248
and x12, x10, x3
sltu x3, x12, x5
lh x7, 90(x31)
sh x2, 108(x31)
bge x8, x10, L14
sw x5, 188(x31)
xor x5, x8, x10
L14:
sub x5, x2, x11
sh x1, 70(x31)
blt x1, x6, L15
auipc x11, 72095
auipc x5, 50854
sra x1, x1, x1
sb x11, 84(x31)
L15:
sh x4, 140(x31)
beq x5, x9, L16
and x10, x2, x2
L16:
jal x7, L17
L17:
sb x7, 26(x31)
sll x11, x0, x6
bgeu x5, x5, L18
lui x2, 245685
sub x4, x12, x11
sltu x4, x1, x5
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
