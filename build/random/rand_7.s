# random program, seed 7
li x1, -1499591369
li x2, 648258640
li x3, 154112043
li x4, 31936245
li x5, -1986441000
li x6, -284989606
li x7, -1847456881
li x8, -324187610
li x9, 1922895273
li x10, -443753964
li x11, 2045500108
li x12, 1539610315
li x31, 0
sub x10, x11, x10
sub x9, x10, x4
srli x8, x8, 23
lbu x10, 41(x31)
sltiu x12, x10, -1449
bne x3, x7, L0
sub x9, x6, x6
lui x10, 956731
sub x5, x11, x12
L0:
auipc x11, 934576
andi x6, x8, 863
auipc x30, 0
jalr x8, x30, 8
bne x7, x8, L1
sra x7, x3, x9
srl x6, x7, x3
L1:
bne x1, x10, L2
sltu x1, x9, x10
L2:
or x10, x12, x0
lw x7, 200(x31)
srl x1, x4, x2
add x10, x2, x10
bltu x11, x6, L3
lui x8, 257618
L3:
bge x5, x2, L4
lh x12, 244(x31)
add x4, x9, x12
slli x9, x11, 5
L4:
xor x3, x4, x9
slt x4, x12, x4
addi x1, x8, 75
auipc x30, 0
jalr x8, x30, 16
lh x2, 186(x31)
slt x8, x4, x10
andi x6, x2, -1066
lbu x3, 244(x31)
auipc x2, 830133
lb x3, 81(x31)
and x8, x3, x10
auipc x6, 326972
add x12, x9, x3
sb x5, 14(x31)
lh x9, 132(x31)
xor x8, x9, x9
jal x9, L5
srli x3, x3, 11
L5:
jal x9, L6
L6:
bltu x2, x1, L7
sltu x1, x9, x1
lb x6, 226(x31)
lui x9, 418178
lhu x9, 244(x31)
L7:
lh x8, 102(x31)
jal x7, L8
L8:
slt x7, x11, x2
xor x3, x3, x4
sra x3, x4, x7
xori x4, x2, 949
bge x1, x9, L9
lui x9, 134827
slt x2, x5, x0
sll x7, x11, x5
ori x9, x12, 631
L9:
bgeu x2, x1, L10
L10:
lb x2, 113(x31)
add x6, x7, x5
slt x2, x5, x4
lui x9, 431743
slli x5, x1, 16
bgeu x4, x4, L11
L11:
srl x11, x7, x5
sh x12, 100(x31)
xor x1, x1, x12
addi x2, x7, 261
lb x3, 235(x31)
jal x1, L12
xor x9, x1, x5
sll x1, x2, x9
auipc x4, 10382
L12:
bne x1, x5, L13
L13:
and x9, x3, x12
lui x6, 1036393
jal x1, L14
sw x9, 216(x31)
L14:
jal x11, L15
L15:
sw x1, 116(x31)
jal x2, L16
xori x9, x1, -45
addi x8, x12, -1295
L16:
sra x5, x5, x4
auipc x8, 1035885
sltu x1, x11, x10
jal x11, L17
lh x1, 68(x31)
xori x5, x2, -265
L17:
or x5, x8, x9
auipc x30, 0
jalr x8, x30, 8
beq x8, x7, L18
slt x2, x3, x5
sb x12, 143(x31)
xori x8, x3, -2019
L18:
lhu x12, 154(x31)
jal x7, L19
sltiu x1, x6, 1214
slt x12, x12, x6
L19:
bltu x7, x1, L20
add x11, x3, x5
sltiu x4, x7, -1811
lhu x12, 104(x31)
L20:
bge x3, x5, L21
ori x3, x7, 767
sltu x12, x11, x11
sra x9, x2, x3
L21:
bge x8, x8, L22
ori x4, x3, 753
srli x4, x10, 12
sw x12, 208(x31)
srli x5, x1, 31
L22:
sb x4, 110(x31)
auipc x7, 654345
sb x12, 65(x31)
lw x1, 248(x31)
bge x4, x4, L23
or x11, x12, x8
add x1, x4, x1
auipc x5, 268365
lui x9, 917358
L23:
sub x5, x10, x5
lui x1, 632335
xor x11, x4, x4
srl x12, x1, x8
auipc x2, 539505
sltiu x4, x12, 721
xori x4, x5, -1496
sh x4, 98(x31)
sb x4, 253(x31)
sb x1, 74(x31)
sb x1, 212(x31)
auipc x30, 0
jalr x12, x30, 20
sw x3, 56(x31)
slti x11, x12, 1782
srl x6, x8, x1
blt x2, x4, L24
L24:
lh x2, 220(x31)
bne x8, x6, L25
lhu x11, 14(x31)
andi x7, x1, 1753
add x5, x2, x6
L25:
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
