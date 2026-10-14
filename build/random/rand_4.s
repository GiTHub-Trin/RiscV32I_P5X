# random program, seed 4
li x1, -1133664809
li x2, -446426455
li x3, -1481882790
li x4, -1861803471
li x5, 1795103241
li x6, 1138864728
li x7, 157539438
li x8, -1691429874
li x9, 1835993865
li x10, 1317061808
li x11, 1290413637
li x12, -1316683993
li x31, 0
lui x12, 780964
blt x9, x4, L0
addi x9, x1, 343
srli x9, x7, 18
slti x4, x1, -1384
sltu x9, x8, x3
L0:
srl x4, x8, x6
lui x11, 416729
add x12, x10, x4
jal x5, L1
addi x6, x5, 631
L1:
blt x11, x10, L2
lb x10, 150(x31)
sra x5, x7, x3
L2:
add x8, x6, x10
bge x2, x1, L3
lw x10, 76(x31)
L3:
bltu x1, x9, L4
srl x11, x8, x8
addi x4, x4, 1456
sh x5, 96(x31)
L4:
slli x7, x3, 20
bltu x10, x11, L5
auipc x12, 84941
addi x7, x10, -693
L5:
auipc x11, 660680
srai x11, x6, 25
sltu x11, x1, x10
jal x11, L6
sb x12, 237(x31)
xori x4, x4, -764
L6:
beq x7, x9, L7
slt x3, x6, x9
lhu x1, 224(x31)
L7:
beq x5, x3, L8
sub x9, x5, x2
or x8, x5, x8
sh x10, 48(x31)
lh x7, 222(x31)
L8:
lb x11, 100(x31)
sh x3, 60(x31)
sll x6, x6, x1
sltu x2, x8, x10
slt x7, x6, x3
lui x11, 110980
xori x10, x9, 1562
slti x5, x6, 737
jal x10, L9
L9:
jal x5, L10
sh x6, 100(x31)
L10:
sb x3, 206(x31)
slti x5, x10, -1884
lb x2, 183(x31)
jal x11, L11
slli x2, x8, 14
lui x11, 635154
sw x4, 204(x31)
L11:
lh x4, 188(x31)
srai x8, x7, 25
xori x7, x5, -542
ori x10, x7, 1135
sub x8, x11, x10
sh x8, 246(x31)
lbu x2, 122(x31)
sb x11, 203(x31)
lw x1, 132(x31)
sub x4, x6, x5
bltu x12, x3, L12
auipc x3, 170514
srai x1, x9, 9
L12:
sltu x8, x7, x5
srli x7, x7, 3
add x5, x3, x2
sb x8, 118(x31)
srli x12, x11, 24
or x10, x8, x6
auipc x7, 78068
and x11, x8, x6
slt x6, x11, x1
srli x2, x1, 31
sw x11, 124(x31)
bne x2, x9, L13
sb x10, 115(x31)
sw x12, 16(x31)
xor x4, x12, x5
sw x7, 204(x31)
L13:
or x9, x12, x4
slti x4, x7, 212
sw x10, 208(x31)
sub x1, x10, x11
jal x2, L14
sb x5, 47(x31)
auipc x11, 1046985
L14:
auipc x1, 955516
sub x4, x2, x6
srai x3, x2, 11
lbu x5, 105(x31)
bgeu x10, x3, L15
slt x1, x3, x1
lh x2, 252(x31)
L15:
lhu x10, 244(x31)
srli x7, x1, 2
auipc x30, 0
jalr x4, x30, 16
xor x10, x10, x7
andi x2, x4, 804
auipc x30, 0
jalr x1, x30, 12
slt x5, x12, x9
sltu x12, x3, x7
addi x8, x8, -1805
sw x6, 212(x31)
slli x8, x11, 3
auipc x30, 0
jalr x10, x30, 12
addi x12, x7, 1531
lui x10, 89511
jal x4, L16
sltiu x9, x3, 782
sw x6, 176(x31)
L16:
sll x6, x4, x2
bne x3, x3, L17
lui x1, 726016
sb x10, 24(x31)
sll x5, x5, x5
sra x5, x1, x5
L17:
xor x9, x6, x7
lb x4, 145(x31)
sb x12, 103(x31)
sb x9, 1(x31)
addi x9, x11, -668
srai x1, x2, 8
sub x9, x6, x3
and x2, x1, x5
sltiu x10, x3, 921
and x8, x8, x10
lui x10, 406597
lui x10, 947235
sll x6, x6, x9
xor x11, x2, x6
sra x2, x5, x1
bgeu x3, x4, L18
L18:
auipc x7, 507085
sh x6, 148(x31)
add x7, x3, x12
blt x6, x3, L19
xor x2, x10, x6
L19:
andi x2, x2, 1629
add x2, x3, x8
lhu x7, 162(x31)
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
