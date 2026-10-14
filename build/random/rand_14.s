# random program, seed 14
li x1, 1891299130
li x2, -1048936187
li x3, 1005277327
li x4, 680537650
li x5, -846160206
li x6, -443783326
li x7, -1638961366
li x8, 1724270823
li x9, -1029064159
li x10, -1504511745
li x11, 704370583
li x12, -1439036296
li x31, 0
xor x1, x4, x7
sh x11, 48(x31)
srai x11, x2, 31
sra x10, x5, x2
jal x5, L0
L0:
srl x2, x10, x8
srl x8, x8, x10
srl x4, x10, x2
sltiu x10, x12, 1275
sltiu x12, x8, 110
slli x11, x5, 6
sltu x1, x10, x9
sltiu x2, x3, -418
bltu x4, x11, L1
sh x10, 188(x31)
lbu x6, 101(x31)
L1:
srl x9, x6, x10
bge x2, x2, L2
add x12, x4, x8
srl x1, x5, x9
slti x8, x3, -640
L2:
jal x11, L3
sh x8, 22(x31)
L3:
addi x6, x11, -1256
sub x1, x3, x0
srl x10, x8, x8
sub x5, x11, x9
bgeu x6, x2, L4
xori x5, x6, -1809
L4:
and x12, x4, x8
bge x7, x7, L5
L5:
lhu x1, 102(x31)
lbu x9, 198(x31)
lbu x5, 99(x31)
sub x8, x9, x4
lh x8, 216(x31)
lb x12, 94(x31)
lhu x10, 54(x31)
xor x6, x5, x10
sltu x8, x9, x1
lhu x11, 186(x31)
lbu x1, 67(x31)
lbu x5, 116(x31)
lui x10, 734651
auipc x30, 0
jalr x9, x30, 12
auipc x6, 906410
blt x5, x4, L6
L6:
or x12, x7, x8
bge x10, x2, L7
L7:
slli x1, x4, 24
auipc x30, 0
jalr x3, x30, 8
sh x12, 60(x31)
sw x2, 116(x31)
jal x6, L8
addi x11, x6, -1049
sh x8, 138(x31)
sb x8, 181(x31)
L8:
lw x4, 192(x31)
or x12, x3, x7
bge x8, x9, L9
L9:
sh x9, 78(x31)
lh x5, 124(x31)
lb x4, 130(x31)
sll x4, x2, x1
auipc x30, 0
jalr x1, x30, 16
sw x3, 120(x31)
sltu x3, x7, x5
slti x12, x3, 1678
lh x9, 102(x31)
auipc x2, 1035323
or x6, x6, x6
add x6, x3, x8
andi x7, x1, 1222
sb x10, 146(x31)
lw x7, 244(x31)
sltiu x7, x8, 125
addi x3, x5, -1050
lhu x4, 28(x31)
sll x7, x3, x12
auipc x30, 0
jalr x4, x30, 8
sb x9, 167(x31)
sb x9, 54(x31)
slt x9, x1, x10
xori x10, x9, 1885
beq x12, x10, L10
L10:
lbu x5, 52(x31)
slt x8, x6, x5
lhu x4, 212(x31)
lbu x10, 95(x31)
sra x3, x11, x8
auipc x30, 0
jalr x6, x30, 20
auipc x5, 891380
lh x1, 0(x31)
ori x9, x4, -1813
sh x3, 38(x31)
lui x7, 800702
slti x2, x9, 1045
sub x12, x2, x11
or x5, x4, x12
auipc x2, 818266
sltiu x2, x2, 360
slt x2, x12, x1
sltu x9, x6, x12
lb x8, 48(x31)
lb x11, 153(x31)
sltiu x12, x3, -1347
lui x9, 351259
lw x12, 100(x31)
srli x7, x2, 6
srli x2, x3, 25
sw x6, 128(x31)
xori x12, x5, 105
lbu x12, 151(x31)
andi x7, x9, 1622
sb x2, 244(x31)
add x12, x2, x3
srli x12, x3, 13
bne x10, x7, L11
addi x3, x4, -680
lbu x8, 160(x31)
L11:
xor x5, x9, x7
lh x9, 180(x31)
sb x7, 19(x31)
and x1, x1, x11
andi x8, x12, -253
auipc x30, 0
jalr x7, x30, 16
sw x12, 4(x31)
ori x5, x1, -2000
beq x1, x1, L12
L12:
sll x5, x11, x2
sltu x2, x7, x7
sltiu x9, x10, 1468
srai x5, x1, 10
andi x10, x2, 1327
srai x3, x7, 4
sw x11, 32(x31)
slli x3, x4, 14
srli x5, x8, 13
srl x2, x5, x2
sltiu x1, x4, -1740
xor x1, x9, x9
add x1, x2, x9
lb x11, 135(x31)
andi x12, x11, 1551
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
