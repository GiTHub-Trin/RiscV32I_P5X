# random program, seed 9
li x1, -544121104
li x2, -1552461398
li x3, -2119845296
li x4, 11948934
li x5, -1800387369
li x6, -519606845
li x7, 966648405
li x8, -1472498778
li x9, -1125229012
li x10, -1670967639
li x11, 388387290
li x12, -896883309
li x31, 0
lhu x5, 44(x31)
sltiu x1, x1, 1320
bge x4, x2, L0
sb x4, 62(x31)
sb x2, 169(x31)
add x9, x8, x4
L0:
andi x2, x3, -635
lb x5, 27(x31)
lui x3, 562688
slli x2, x7, 15
auipc x30, 0
jalr x12, x30, 8
lw x6, 44(x31)
blt x7, x10, L1
lhu x1, 168(x31)
slti x4, x6, -1321
sltiu x2, x1, -1840
ori x7, x12, -15
L1:
slt x2, x7, x9
auipc x3, 542977
blt x2, x1, L2
sra x4, x5, x6
L2:
sltiu x3, x12, 376
sra x3, x7, x3
and x10, x2, x5
sub x3, x4, x4
auipc x30, 0
jalr x10, x30, 20
srli x2, x8, 16
srai x1, x10, 27
srai x9, x2, 19
bgeu x2, x8, L3
add x11, x6, x8
L3:
sw x1, 252(x31)
add x11, x10, x4
beq x6, x9, L4
slli x12, x6, 5
L4:
sra x10, x7, x3
bgeu x3, x4, L5
add x2, x11, x6
add x8, x4, x11
L5:
blt x11, x8, L6
L6:
lui x2, 874833
bge x10, x11, L7
sltu x3, x3, x7
sh x8, 48(x31)
L7:
lui x8, 727589
sh x5, 106(x31)
lui x10, 956111
srl x1, x3, x1
auipc x30, 0
jalr x11, x30, 16
sw x8, 40(x31)
sw x9, 196(x31)
or x7, x12, x9
addi x5, x4, -1463
sh x6, 20(x31)
auipc x30, 0
jalr x9, x30, 8
sw x10, 200(x31)
xor x6, x4, x7
lbu x1, 87(x31)
sh x11, 244(x31)
sb x9, 139(x31)
lbu x6, 91(x31)
jal x12, L8
lui x9, 584239
sb x11, 95(x31)
L8:
sltiu x4, x3, 1415
and x7, x9, x12
sltiu x7, x7, -486
sw x5, 40(x31)
lw x9, 92(x31)
blt x3, x12, L9
sw x6, 100(x31)
sll x6, x1, x0
sra x12, x3, x10
lw x9, 192(x31)
L9:
jal x1, L10
sh x8, 70(x31)
lw x9, 48(x31)
sw x10, 132(x31)
L10:
sw x12, 4(x31)
bge x2, x1, L11
sub x5, x4, x11
auipc x5, 776181
sh x3, 164(x31)
slli x3, x4, 5
L11:
blt x12, x6, L12
L12:
lb x12, 48(x31)
slti x1, x3, 1407
auipc x11, 731440
srli x1, x9, 20
srl x9, x2, x6
lbu x5, 211(x31)
xori x9, x3, -1525
lh x8, 216(x31)
beq x4, x8, L13
add x4, x1, x10
slli x8, x7, 17
lbu x9, 37(x31)
L13:
andi x7, x4, 451
auipc x8, 658515
srli x1, x11, 30
xor x2, x3, x9
sh x2, 210(x31)
sltu x8, x2, x10
lbu x1, 141(x31)
andi x8, x6, 606
xor x12, x6, x6
sub x10, x1, x8
bne x7, x1, L14
sb x2, 60(x31)
sltu x1, x5, x8
lbu x5, 44(x31)
L14:
sll x5, x5, x12
lbu x10, 252(x31)
andi x11, x4, 1256
sll x12, x1, x7
jal x2, L15
lui x10, 813858
sltiu x3, x4, 885
srai x2, x1, 23
L15:
sw x9, 112(x31)
sw x10, 228(x31)
sltiu x4, x3, 1268
slt x10, x1, x3
lui x7, 269367
lh x2, 244(x31)
or x3, x9, x6
and x11, x2, x0
slli x9, x6, 17
auipc x30, 0
jalr x11, x30, 16
slt x2, x7, x12
andi x11, x12, -491
sh x4, 36(x31)
slli x2, x6, 2
auipc x12, 575342
or x5, x5, x1
sll x6, x5, x10
add x7, x11, x2
jal x11, L16
lhu x6, 236(x31)
L16:
lui x10, 1036717
sltiu x8, x10, -346
jal x8, L17
xor x12, x8, x11
L17:
blt x5, x5, L18
L18:
bge x7, x11, L19
ori x6, x4, -1477
sb x10, 170(x31)
L19:
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
