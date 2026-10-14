# random program, seed 19
li x1, 760749655
li x2, 87901487
li x3, 49356480
li x4, -457265134
li x5, -1026159702
li x6, -1028914420
li x7, -811469323
li x8, -1277529305
li x9, 182289563
li x10, 1002748496
li x11, 1301630790
li x12, -367487739
li x31, 0
bge x5, x9, L0
sw x9, 208(x31)
slli x4, x3, 8
lui x2, 960641
L0:
bge x9, x9, L1
xori x9, x1, -42
sra x7, x11, x5
sh x5, 144(x31)
L1:
sltiu x5, x1, -1415
lhu x8, 50(x31)
bge x1, x11, L2
sub x3, x5, x2
sra x11, x7, x11
srl x10, x11, x10
srli x5, x9, 20
L2:
bgeu x2, x9, L3
ori x3, x9, 91
srai x12, x5, 18
L3:
srli x1, x4, 9
bltu x2, x8, L4
L4:
lh x3, 188(x31)
sw x11, 48(x31)
addi x6, x7, 959
lb x5, 151(x31)
sh x3, 16(x31)
lb x1, 46(x31)
sll x10, x9, x1
sltu x2, x8, x12
srai x4, x2, 15
ori x4, x5, -1560
lb x10, 97(x31)
bge x8, x8, L5
srl x1, x11, x4
L5:
bge x12, x3, L6
andi x10, x5, 1242
addi x10, x1, -66
sb x3, 138(x31)
L6:
xori x7, x3, -1269
auipc x30, 0
jalr x5, x30, 8
sw x3, 168(x31)
srli x1, x1, 5
add x2, x12, x6
sll x2, x1, x3
bge x12, x2, L7
srai x10, x10, 10
and x7, x4, x2
L7:
bne x3, x11, L8
andi x9, x4, 10
sra x9, x7, x2
sw x4, 220(x31)
L8:
and x4, x1, x5
slti x12, x9, -1509
addi x10, x11, 1610
srai x10, x8, 24
xori x3, x9, 1198
jal x10, L9
sub x12, x6, x8
andi x2, x8, -1704
or x1, x8, x8
L9:
sltu x3, x6, x8
sh x4, 198(x31)
sll x4, x3, x1
sh x11, 174(x31)
xori x8, x2, -1502
lui x6, 327520
auipc x30, 0
jalr x6, x30, 12
sh x3, 192(x31)
sw x5, 16(x31)
sw x2, 40(x31)
sll x10, x4, x9
xori x5, x11, 533
auipc x30, 0
jalr x8, x30, 12
lb x12, 87(x31)
lui x6, 585412
lh x6, 2(x31)
ori x3, x3, -1107
lh x5, 180(x31)
lh x11, 132(x31)
jal x6, L10
L10:
addi x11, x5, 1552
auipc x30, 0
jalr x4, x30, 20
sltiu x1, x4, 982
sra x2, x8, x12
lui x2, 551415
lhu x11, 204(x31)
sw x2, 84(x31)
xor x9, x11, x7
srli x6, x11, 9
addi x9, x10, -991
sh x2, 22(x31)
slt x6, x6, x10
sh x3, 122(x31)
ori x8, x8, 1823
sw x8, 112(x31)
bge x12, x11, L11
L11:
addi x8, x8, 513
andi x4, x5, -1039
sra x9, x6, x10
jal x10, L12
L12:
addi x3, x2, 1154
sll x2, x1, x4
sh x6, 52(x31)
bgeu x6, x6, L13
L13:
sltu x12, x12, x2
or x12, x8, x1
beq x11, x10, L14
auipc x7, 1017192
lb x1, 97(x31)
L14:
lui x5, 594761
ori x5, x4, -1518
sh x10, 72(x31)
sh x6, 240(x31)
bltu x10, x2, L15
sb x3, 145(x31)
lbu x7, 100(x31)
sh x5, 170(x31)
L15:
slti x11, x4, 1207
auipc x6, 367783
auipc x6, 819589
and x2, x5, x6
slt x2, x4, x7
slti x10, x1, -1712
ori x10, x6, 387
slti x12, x1, 1682
lh x10, 64(x31)
lh x7, 68(x31)
or x10, x9, x2
or x9, x6, x11
auipc x30, 0
jalr x3, x30, 16
srl x10, x2, x9
sub x1, x8, x4
sh x3, 90(x31)
ori x6, x4, 1530
slt x3, x1, x12
jal x5, L16
sll x5, x9, x9
srl x9, x4, x4
srai x9, x7, 11
L16:
lbu x4, 91(x31)
lbu x3, 139(x31)
ori x6, x3, -759
slli x2, x7, 13
srai x9, x11, 0
bne x7, x3, L17
srl x2, x12, x7
ori x6, x1, 1872
sll x5, x5, x8
L17:
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
