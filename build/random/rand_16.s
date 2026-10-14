# random program, seed 16
li x1, -594755157
li x2, -83834892
li x3, -356685734
li x4, -228667235
li x5, -1035708234
li x6, 579803096
li x7, -2103982619
li x8, -815578841
li x9, 1242284908
li x10, -1058683618
li x11, 1690244452
li x12, -2029933182
li x31, 0
lui x5, 470465
xori x2, x7, -637
add x5, x1, x4
sltiu x8, x3, 1902
sra x1, x8, x2
lui x8, 47719
lhu x1, 188(x31)
auipc x7, 669776
auipc x11, 148672
sub x9, x1, x1
add x7, x11, x4
auipc x30, 0
jalr x4, x30, 8
sb x7, 75(x31)
bgeu x5, x1, L0
lhu x9, 130(x31)
slti x2, x2, 276
srl x3, x4, x3
L0:
slti x7, x11, 2015
sb x8, 218(x31)
sub x2, x5, x4
ori x8, x8, -1397
sb x2, 160(x31)
lb x9, 171(x31)
auipc x30, 0
jalr x7, x30, 16
sub x4, x4, x11
xor x7, x4, x11
bne x9, x4, L1
L1:
lw x9, 136(x31)
bltu x8, x6, L2
sra x12, x3, x1
xor x12, x11, x2
sll x10, x12, x4
ori x7, x2, 1733
L2:
bltu x11, x3, L3
L3:
sltiu x2, x7, 1310
lui x10, 405841
xori x1, x2, -307
addi x10, x12, 750
blt x3, x6, L4
add x7, x7, x12
addi x3, x1, -675
lbu x10, 150(x31)
L4:
lui x1, 107750
bltu x3, x10, L5
or x5, x10, x5
srli x9, x12, 9
lui x5, 550652
andi x8, x6, -1438
L5:
lh x5, 192(x31)
sw x2, 244(x31)
sh x4, 230(x31)
add x12, x2, x3
sh x2, 208(x31)
sb x6, 162(x31)
slt x3, x12, x9
bgeu x2, x5, L6
L6:
auipc x30, 0
jalr x8, x30, 8
sub x12, x7, x6
slti x10, x3, -224
xor x2, x11, x3
lhu x12, 46(x31)
sh x6, 218(x31)
sltiu x4, x9, -1892
ori x7, x10, -1320
lw x1, 124(x31)
auipc x30, 0
jalr x5, x30, 12
sra x1, x3, x4
andi x6, x4, 338
srl x1, x4, x11
slt x10, x11, x10
bne x7, x8, L7
xor x12, x12, x4
or x5, x5, x6
sub x8, x11, x5
slti x12, x9, -1559
L7:
slti x6, x6, 719
slli x10, x4, 5
sh x9, 94(x31)
and x3, x12, x10
sll x7, x1, x12
ori x5, x11, -1590
sub x3, x1, x6
slli x6, x11, 25
lhu x9, 120(x31)
lh x7, 54(x31)
xori x4, x10, 1532
lbu x7, 100(x31)
and x7, x2, x10
auipc x6, 962611
bltu x3, x2, L8
lui x6, 586008
lui x4, 914309
srl x4, x6, x7
slti x9, x5, 910
L8:
addi x4, x12, -1983
lui x11, 922356
slli x11, x11, 5
ori x8, x11, -1254
srli x10, x6, 18
lh x6, 80(x31)
sw x3, 156(x31)
addi x5, x5, 280
xori x5, x6, 537
sra x3, x6, x1
beq x11, x12, L9
sltiu x7, x5, 1266
lhu x12, 136(x31)
slti x2, x6, 474
L9:
auipc x30, 0
jalr x0, x30, 8
lhu x6, 190(x31)
auipc x30, 0
jalr x12, x30, 20
sltu x12, x8, x11
addi x5, x9, -58
addi x9, x12, -1570
slli x4, x10, 28
sra x2, x0, x12
blt x2, x2, L10
sh x8, 110(x31)
sltu x12, x10, x1
sub x3, x3, x9
slli x1, x0, 3
L10:
beq x6, x4, L11
lb x1, 111(x31)
lui x5, 134064
sw x12, 0(x31)
L11:
lui x1, 4727
sw x4, 24(x31)
lw x7, 120(x31)
sw x5, 224(x31)
srai x1, x9, 20
sltu x11, x3, x2
bgeu x6, x7, L12
sltu x12, x3, x8
sh x8, 186(x31)
lh x8, 224(x31)
L12:
bgeu x1, x5, L13
lh x8, 126(x31)
L13:
lh x9, 16(x31)
sltu x12, x2, x4
bge x6, x1, L14
sub x5, x11, x1
ori x5, x12, 543
slt x1, x9, x11
L14:
sltiu x10, x4, -468
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
