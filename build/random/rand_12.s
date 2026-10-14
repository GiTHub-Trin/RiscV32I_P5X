# random program, seed 12
li x1, -109218082
li x2, 714727545
li x3, -1535019803
li x4, -537925359
li x5, 1332934744
li x6, 435754673
li x7, 249924358
li x8, -257462711
li x9, -1450550792
li x10, 1743640679
li x11, 1369322020
li x12, 1470611294
li x31, 0
bgeu x2, x7, L0
L0:
srl x3, x10, x12
srai x2, x7, 30
addi x11, x4, 94
andi x7, x2, 19
ori x10, x9, -579
beq x4, x1, L1
ori x2, x4, -590
sltu x1, x8, x11
lw x6, 232(x31)
L1:
sra x12, x8, x3
slli x4, x4, 0
sh x1, 90(x31)
sub x6, x9, x6
auipc x5, 247689
srli x8, x5, 28
sltu x10, x5, x9
slti x12, x5, -1815
lbu x7, 136(x31)
jal x7, L2
addi x9, x12, 64
L2:
ori x2, x4, 798
auipc x7, 337481
beq x2, x9, L3
srl x2, x4, x12
L3:
ori x2, x10, 1180
xor x6, x6, x2
slti x11, x7, 947
auipc x30, 0
jalr x8, x30, 12
lui x8, 376164
blt x6, x4, L4
xor x6, x4, x5
sll x9, x6, x8
ori x12, x8, -1645
sb x7, 208(x31)
L4:
addi x2, x11, 508
lh x6, 254(x31)
sra x4, x3, x1
xori x11, x7, 581
jal x11, L5
and x7, x10, x6
xori x8, x7, -552
L5:
auipc x30, 0
jalr x5, x30, 12
sltu x9, x11, x12
lh x5, 70(x31)
add x9, x1, x4
auipc x30, 0
jalr x4, x30, 16
sh x2, 10(x31)
xori x9, x2, -1998
lw x11, 248(x31)
xori x7, x1, 233
bge x6, x11, L6
lw x10, 204(x31)
L6:
sll x6, x2, x1
sb x10, 57(x31)
sw x10, 12(x31)
slti x8, x7, 540
andi x10, x1, 919
jal x8, L7
L7:
auipc x1, 414163
andi x6, x6, 734
lhu x4, 174(x31)
auipc x10, 758468
bge x10, x9, L8
auipc x8, 585209
srl x2, x10, x3
L8:
and x10, x6, x6
sw x10, 232(x31)
xor x10, x6, x3
andi x11, x9, 643
or x2, x3, x2
sra x4, x12, x4
slt x10, x12, x8
jal x7, L9
xori x6, x4, -89
lui x12, 1017011
srai x12, x12, 21
L9:
addi x2, x5, 1149
sra x3, x9, x6
auipc x30, 0
jalr x7, x30, 20
sb x9, 25(x31)
slti x4, x9, 1062
srli x10, x4, 9
ori x5, x9, 958
slt x9, x4, x9
xori x10, x10, -1575
sra x7, x7, x9
srai x9, x1, 23
xor x2, x10, x5
ori x12, x2, -1680
auipc x6, 601443
auipc x1, 240782
and x3, x9, x3
sh x1, 114(x31)
and x8, x3, x1
lhu x3, 104(x31)
sh x10, 182(x31)
sltiu x1, x9, -1970
sh x1, 70(x31)
or x11, x4, x2
sll x12, x11, x5
sltiu x6, x11, 533
slti x4, x2, 1876
lbu x11, 103(x31)
srli x12, x4, 8
sra x12, x3, x11
and x2, x11, x2
slti x3, x10, -581
or x12, x6, x11
auipc x30, 0
jalr x8, x30, 12
lhu x3, 70(x31)
sh x8, 116(x31)
sh x11, 126(x31)
sll x9, x9, x11
beq x9, x4, L10
auipc x9, 383498
lb x2, 4(x31)
lbu x5, 206(x31)
slli x8, x12, 5
L10:
lb x7, 83(x31)
beq x2, x0, L11
sh x2, 154(x31)
sw x12, 84(x31)
L11:
bge x5, x2, L12
sltu x4, x5, x8
addi x2, x1, -753
sra x11, x7, x11
L12:
sll x10, x12, x8
slt x1, x4, x7
lbu x2, 69(x31)
xor x7, x8, x2
addi x6, x5, -451
bne x12, x10, L13
lbu x2, 148(x31)
L13:
beq x9, x6, L14
srl x10, x2, x9
L14:
slti x11, x8, 715
sll x5, x2, x1
slt x6, x5, x7
sh x11, 62(x31)
bge x7, x10, L15
L15:
srli x7, x9, 30
lui x10, 15766
lh x12, 86(x31)
lh x4, 36(x31)
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
