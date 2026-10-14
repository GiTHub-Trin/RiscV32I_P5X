# random program, seed 13
li x1, -1035050629
li x2, 1005123725
li x3, -1588222948
li x4, -881942512
li x5, -293860246
li x6, -1517367605
li x7, 1314461158
li x8, 1401728461
li x9, 1051193913
li x10, 1929829377
li x11, -1044931275
li x12, 1502976610
li x31, 0
lw x11, 216(x31)
sltiu x11, x10, 105
srai x3, x12, 28
sll x9, x6, x10
sw x10, 248(x31)
xor x3, x11, x8
lb x3, 115(x31)
lhu x3, 128(x31)
lh x4, 178(x31)
auipc x9, 287325
lbu x4, 254(x31)
and x1, x12, x3
or x2, x3, x11
lb x6, 225(x31)
slli x5, x5, 17
lhu x1, 186(x31)
bne x9, x8, L0
slt x5, x7, x3
lh x11, 216(x31)
L0:
srl x10, x4, x7
addi x6, x2, -1487
lui x1, 642524
auipc x30, 0
jalr x9, x30, 20
addi x5, x3, -833
sb x4, 188(x31)
ori x7, x6, -998
bge x10, x1, L1
sltiu x3, x1, 595
or x12, x1, x11
sra x6, x5, x4
L1:
bgeu x4, x8, L2
srl x10, x9, x2
L2:
sh x9, 202(x31)
add x1, x1, x12
xor x11, x10, x11
add x2, x7, x8
sll x8, x9, x5
slt x6, x8, x3
sw x7, 236(x31)
sb x9, 17(x31)
auipc x30, 0
jalr x1, x30, 8
xori x10, x1, -293
sw x9, 216(x31)
blt x3, x12, L3
srli x4, x10, 6
L3:
slli x10, x6, 14
srli x4, x12, 0
bge x3, x12, L4
sltu x10, x12, x12
L4:
auipc x30, 0
jalr x1, x30, 8
or x1, x6, x10
srli x2, x8, 17
lbu x7, 167(x31)
lhu x1, 152(x31)
xori x8, x12, -1549
beq x6, x9, L5
or x5, x11, x2
L5:
auipc x2, 810860
addi x3, x1, -1593
slli x11, x7, 5
sb x10, 57(x31)
bgeu x12, x5, L6
slti x5, x10, 1373
sh x11, 108(x31)
add x2, x5, x4
lui x2, 216440
L6:
lui x1, 881013
jal x4, L7
sltiu x2, x8, -1326
lh x1, 228(x31)
slti x12, x9, -899
L7:
srl x1, x6, x12
auipc x30, 0
jalr x12, x30, 12
sll x11, x1, x10
srl x9, x3, x7
xori x6, x7, 307
bge x10, x1, L8
lhu x9, 52(x31)
L8:
srli x12, x9, 2
slt x7, x5, x1
sra x7, x3, x4
slli x7, x11, 12
addi x1, x8, 1172
sb x8, 232(x31)
ori x9, x1, -1558
slti x4, x1, 1393
slli x8, x7, 2
lhu x3, 76(x31)
jal x3, L9
L9:
sra x4, x8, x12
addi x2, x2, 1127
and x1, x7, x12
sltiu x3, x10, -612
sw x7, 36(x31)
and x7, x5, x1
bge x11, x3, L10
sra x4, x10, x12
lui x1, 267935
slti x8, x7, 172
L10:
blt x2, x2, L11
L11:
beq x11, x3, L12
lhu x10, 238(x31)
lhu x10, 8(x31)
L12:
lh x7, 40(x31)
sb x3, 107(x31)
beq x5, x5, L13
lhu x8, 100(x31)
L13:
auipc x30, 0
jalr x5, x30, 20
sltu x8, x8, x1
addi x8, x4, -1048
lui x12, 677511
beq x9, x5, L14
lhu x7, 0(x31)
srl x1, x3, x11
sltiu x12, x4, -1860
L14:
beq x5, x10, L15
sw x12, 144(x31)
L15:
lh x9, 32(x31)
sub x7, x8, x6
srl x5, x7, x4
beq x3, x11, L16
slti x4, x6, -1033
L16:
bge x7, x2, L17
xori x9, x5, 1025
addi x9, x2, 844
L17:
lb x6, 170(x31)
sw x2, 196(x31)
sw x9, 200(x31)
beq x11, x8, L18
lbu x10, 206(x31)
L18:
bge x1, x4, L19
sh x6, 140(x31)
lh x3, 134(x31)
L19:
bne x11, x5, L20
L20:
sh x3, 14(x31)
sltiu x7, x5, -597
lb x2, 8(x31)
slt x8, x3, x6
bltu x7, x7, L21
sb x2, 228(x31)
sw x2, 156(x31)
ori x2, x5, 1575
L21:
auipc x30, 0
jalr x0, x30, 20
sb x9, 132(x31)
sw x7, 160(x31)
or x1, x4, x9
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
