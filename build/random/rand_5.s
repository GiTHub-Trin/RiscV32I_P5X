# random program, seed 5
li x1, 527858757
li x2, 1038467225
li x3, 1904202612
li x4, 639840853
li x5, 1721854523
li x6, -1661267722
li x7, -1088461400
li x8, 187951464
li x9, 317574981
li x10, -1216636254
li x11, -947116003
li x12, 1141282117
li x31, 0
jal x3, L0
L0:
slti x1, x1, -333
sb x4, 85(x31)
lbu x12, 93(x31)
auipc x30, 0
jalr x5, x30, 20
srl x3, x5, x5
lw x10, 0(x31)
lh x5, 32(x31)
andi x6, x8, -606
bgeu x7, x0, L1
L1:
addi x8, x3, -439
bge x6, x5, L2
lb x5, 188(x31)
L2:
bne x10, x3, L3
L3:
sw x6, 44(x31)
lbu x8, 158(x31)
auipc x30, 0
jalr x2, x30, 8
srli x1, x10, 22
xori x3, x11, -1780
slti x3, x10, -961
lb x7, 86(x31)
srl x5, x10, x9
andi x6, x5, 1802
srl x9, x11, x6
auipc x30, 0
jalr x5, x30, 20
srai x9, x6, 2
lh x8, 142(x31)
sltu x6, x10, x8
sltu x8, x9, x6
auipc x12, 856621
sw x6, 228(x31)
slli x4, x8, 18
lhu x10, 86(x31)
lui x11, 882464
srai x5, x1, 12
auipc x30, 0
jalr x10, x30, 20
auipc x4, 378605
auipc x1, 988986
sb x2, 27(x31)
slt x9, x8, x11
lui x4, 784357
blt x2, x9, L4
addi x9, x2, 370
srli x10, x6, 8
ori x11, x8, -884
L4:
jal x10, L5
slti x3, x6, -2041
sltiu x10, x9, -896
ori x7, x4, 1994
L5:
sh x3, 196(x31)
sltu x8, x1, x5
sra x1, x10, x4
lhu x8, 6(x31)
sra x1, x5, x12
and x8, x10, x2
blt x12, x5, L6
lb x6, 237(x31)
L6:
lw x1, 64(x31)
bge x2, x9, L7
srl x7, x12, x11
auipc x7, 997656
andi x4, x8, -1507
addi x12, x10, 297
L7:
sltiu x3, x12, 2029
srli x10, x1, 4
sub x2, x1, x7
sw x2, 248(x31)
auipc x2, 282330
lhu x3, 76(x31)
slti x2, x1, -1162
lh x10, 28(x31)
lw x1, 68(x31)
ori x8, x11, 1017
sltu x3, x11, x9
sub x9, x5, x3
sh x12, 198(x31)
beq x1, x2, L8
srli x4, x8, 30
sb x7, 15(x31)
L8:
bge x4, x2, L9
sw x3, 248(x31)
L9:
slti x5, x10, 808
andi x6, x11, 1502
addi x10, x4, -570
add x3, x1, x8
xori x8, x10, 1463
slti x3, x2, 1021
sh x2, 76(x31)
sltu x11, x8, x6
addi x12, x8, 1816
xor x5, x4, x3
bltu x2, x12, L10
L10:
xori x6, x12, 1786
auipc x30, 0
jalr x3, x30, 12
lb x12, 220(x31)
add x8, x7, x1
sw x12, 176(x31)
beq x1, x11, L11
srl x1, x7, x11
add x4, x9, x4
slli x6, x2, 10
L11:
sb x6, 8(x31)
srli x9, x12, 0
xori x4, x3, 505
lh x6, 206(x31)
jal x8, L12
L12:
srl x10, x5, x12
lh x2, 190(x31)
bge x9, x5, L13
auipc x3, 59389
andi x11, x1, -1662
L13:
srl x9, x2, x3
lh x2, 16(x31)
lb x2, 14(x31)
blt x5, x10, L14
or x7, x4, x1
L14:
auipc x30, 0
jalr x12, x30, 12
sh x3, 86(x31)
sh x8, 60(x31)
xori x3, x11, -733
sw x7, 0(x31)
add x1, x4, x6
sltu x4, x9, x4
lb x7, 253(x31)
slt x8, x2, x2
slt x6, x8, x10
bge x2, x10, L15
lui x7, 46593
L15:
sltu x9, x8, x12
sw x7, 28(x31)
lui x11, 433664
sub x6, x12, x1
lb x2, 19(x31)
sh x2, 106(x31)
or x7, x1, x7
auipc x30, 0
jalr x11, x30, 12
lui x7, 679931
bgeu x6, x2, L16
sltu x5, x2, x3
srl x3, x2, x11
sw x7, 208(x31)
ori x4, x5, -1357
L16:
sb x2, 215(x31)
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
