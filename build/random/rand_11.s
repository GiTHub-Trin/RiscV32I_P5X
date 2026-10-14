# random program, seed 11
li x1, -147531839
li x2, 375314994
li x3, 51147202
li x4, 1258326099
li x5, -1743226477
li x6, -844385151
li x7, 2071004980
li x8, 1996119480
li x9, 121896630
li x10, -1891713581
li x11, -154900306
li x12, 1470713325
li x31, 0
auipc x8, 9633
sltiu x7, x2, 32
sltu x1, x0, x2
addi x11, x4, -1620
sh x11, 214(x31)
auipc x30, 0
jalr x6, x30, 16
xor x1, x2, x12
add x8, x3, x4
sll x7, x2, x4
blt x1, x7, L0
sw x3, 48(x31)
sltu x1, x6, x7
sub x4, x4, x6
xori x3, x8, -937
L0:
sll x5, x10, x4
jal x11, L1
sh x2, 40(x31)
L1:
blt x12, x7, L2
sw x3, 248(x31)
sb x9, 64(x31)
auipc x10, 155483
slt x12, x5, x4
L2:
blt x10, x2, L3
xori x6, x12, -899
L3:
sh x1, 182(x31)
bge x5, x2, L4
L4:
blt x12, x3, L5
lh x2, 180(x31)
lb x1, 213(x31)
sw x7, 4(x31)
addi x10, x2, -1102
L5:
sw x12, 168(x31)
xori x9, x9, -1804
add x4, x2, x10
addi x6, x11, -389
lh x8, 226(x31)
andi x5, x7, -408
ori x6, x3, 2019
sb x5, 32(x31)
sra x5, x7, x9
ori x8, x1, 230
sltu x10, x11, x1
slti x1, x5, -104
lb x2, 228(x31)
auipc x6, 163511
sra x5, x1, x9
sltu x6, x9, x3
lbu x7, 44(x31)
lbu x8, 230(x31)
auipc x30, 0
jalr x7, x30, 8
auipc x9, 719527
auipc x4, 207543
lb x4, 109(x31)
sh x12, 164(x31)
addi x1, x9, 1404
addi x4, x2, 1465
xor x11, x3, x9
srai x12, x8, 5
ori x5, x9, -702
sw x7, 128(x31)
sw x3, 104(x31)
srai x8, x9, 7
lui x1, 92175
ori x2, x12, -682
bge x7, x8, L6
sltiu x7, x8, 550
srl x10, x5, x1
sll x4, x5, x6
sra x2, x10, x9
L6:
lw x1, 220(x31)
ori x10, x4, -260
sw x12, 68(x31)
slti x6, x4, -261
sub x3, x3, x5
xori x9, x3, -405
lb x4, 49(x31)
sltiu x2, x11, 765
lbu x8, 36(x31)
bltu x10, x4, L7
L7:
auipc x30, 0
jalr x3, x30, 12
sh x3, 48(x31)
addi x6, x7, 856
lui x1, 85726
sra x6, x7, x10
auipc x30, 0
jalr x6, x30, 8
lhu x9, 96(x31)
sltiu x5, x12, -737
sltiu x9, x7, -561
lb x5, 174(x31)
xor x11, x1, x11
srl x10, x2, x8
lhu x2, 10(x31)
lh x7, 226(x31)
lhu x2, 4(x31)
xor x9, x7, x10
sra x11, x10, x1
sh x8, 240(x31)
lui x7, 1037111
srai x5, x5, 30
srli x11, x5, 1
bltu x3, x11, L8
sltiu x12, x10, 567
L8:
bge x5, x4, L9
sub x12, x3, x4
L9:
and x7, x4, x6
sra x3, x8, x11
andi x9, x3, 328
sub x9, x9, x6
lui x12, 398510
lbu x9, 127(x31)
sw x1, 20(x31)
ori x1, x9, 231
bgeu x4, x6, L10
L10:
sltiu x6, x3, -1439
ori x4, x12, 66
sll x11, x10, x9
sb x10, 218(x31)
beq x7, x8, L11
lhu x1, 152(x31)
slt x11, x12, x12
L11:
slti x4, x12, 631
sra x10, x11, x8
sh x12, 162(x31)
xor x6, x11, x7
lh x9, 198(x31)
jal x3, L12
sra x5, x4, x9
L12:
jal x1, L13
auipc x7, 134336
lui x5, 176257
L13:
sub x6, x11, x2
auipc x4, 462316
sh x6, 234(x31)
slti x8, x12, -1455
sh x7, 178(x31)
sw x12, 12(x31)
bge x3, x3, L14
L14:
slti x6, x7, 344
sh x5, 156(x31)
lbu x8, 31(x31)
beq x4, x4, L15
lui x10, 989672
lui x4, 926842
sltu x7, x5, x9
L15:
srl x6, x2, x4
sll x7, x9, x1
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
