# random program, seed 21
li x1, -1439031033
li x2, 815042744
li x3, 579820343
li x4, 1256850712
li x5, 53499151
li x6, -2133822931
li x7, 366629129
li x8, -1849993736
li x9, -1965654414
li x10, 1610782485
li x11, 497744153
li x12, -565017372
li x31, 0
jal x2, L0
L0:
sll x9, x7, x3
slti x2, x4, -1467
jal x9, L1
sb x9, 174(x31)
sltiu x8, x6, 1920
addi x2, x12, 2015
L1:
bltu x9, x10, L2
L2:
sb x11, 92(x31)
sh x3, 156(x31)
bge x11, x9, L3
sb x3, 208(x31)
L3:
lui x6, 1029516
auipc x4, 340352
xori x12, x5, -1621
auipc x1, 879862
sltiu x11, x3, 1875
bgeu x12, x4, L4
sh x10, 78(x31)
L4:
xori x5, x10, 212
jal x7, L5
L5:
sb x11, 135(x31)
sh x3, 130(x31)
jal x7, L6
L6:
bgeu x3, x2, L7
L7:
or x6, x4, x3
auipc x30, 0
jalr x4, x30, 20
lw x10, 20(x31)
lb x7, 4(x31)
addi x7, x3, -137
lh x4, 20(x31)
sltiu x9, x8, -1241
and x12, x9, x12
lbu x10, 32(x31)
sh x7, 32(x31)
bgeu x0, x8, L8
L8:
sw x9, 224(x31)
slti x1, x7, -1704
lhu x8, 218(x31)
sltiu x8, x11, -1349
bge x10, x8, L9
lui x10, 549857
L9:
sh x9, 156(x31)
sb x5, 82(x31)
lb x2, 89(x31)
lui x7, 969616
sb x6, 221(x31)
lui x4, 547082
blt x3, x9, L10
L10:
auipc x30, 0
jalr x12, x30, 16
xori x8, x8, 250
auipc x11, 806636
slt x1, x11, x12
and x1, x8, x4
sb x4, 48(x31)
sh x7, 84(x31)
slt x7, x9, x10
sh x2, 8(x31)
bne x9, x10, L11
andi x11, x5, -791
L11:
add x2, x3, x11
sltiu x1, x10, 2007
lhu x1, 80(x31)
bltu x4, x12, L12
sh x4, 40(x31)
add x12, x9, x11
L12:
auipc x30, 0
jalr x8, x30, 16
xori x1, x11, -1593
and x9, x2, x7
andi x6, x6, -628
lui x7, 338635
auipc x30, 0
jalr x4, x30, 20
or x9, x8, x6
sb x6, 207(x31)
srli x10, x1, 27
lbu x4, 54(x31)
srai x5, x4, 27
xori x4, x5, -538
xori x8, x9, 1710
lh x5, 224(x31)
lbu x3, 192(x31)
and x5, x8, x4
srli x11, x6, 8
xori x10, x10, -1469
lh x12, 128(x31)
lbu x2, 170(x31)
sll x3, x5, x10
slt x3, x12, x1
andi x9, x4, -893
srl x1, x10, x1
sra x8, x9, x11
bne x8, x8, L13
lw x8, 112(x31)
lb x4, 232(x31)
L13:
sw x3, 44(x31)
auipc x30, 0
jalr x6, x30, 16
lh x1, 110(x31)
slti x3, x3, -794
or x11, x7, x2
lw x2, 8(x31)
and x2, x7, x9
lhu x6, 154(x31)
lhu x10, 16(x31)
sw x11, 244(x31)
bge x9, x5, L14
andi x8, x7, 352
sltu x10, x6, x3
L14:
sltu x7, x11, x4
bltu x11, x4, L15
srli x12, x8, 19
lui x7, 391211
lb x9, 217(x31)
L15:
slt x3, x6, x0
auipc x8, 521543
srli x4, x10, 11
sltiu x6, x11, -854
lb x4, 29(x31)
ori x7, x3, 1191
blt x4, x10, L16
lbu x1, 62(x31)
sh x12, 96(x31)
auipc x4, 349790
auipc x7, 798531
L16:
sll x9, x3, x2
auipc x30, 0
jalr x0, x30, 8
xor x2, x10, x8
srl x12, x5, x12
lh x11, 236(x31)
sh x6, 178(x31)
auipc x4, 337661
sll x1, x1, x6
slli x1, x10, 14
sw x4, 84(x31)
bge x4, x7, L17
lh x4, 20(x31)
slt x5, x4, x2
L17:
sh x3, 234(x31)
auipc x30, 0
jalr x1, x30, 20
sh x9, 42(x31)
slti x9, x10, -1976
lb x9, 158(x31)
jal x11, L18
L18:
sh x6, 46(x31)
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
