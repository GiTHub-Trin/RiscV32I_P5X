# random program, seed 3
li x1, 189963082
li x2, 446333181
li x3, 1449418665
li x4, -1141039821
li x5, -101562192
li x6, -1500591035
li x7, 579222143
li x8, 99562544
li x9, 1036168857
li x10, -1872470703
li x11, 391269738
li x12, 1569927520
li x31, 0
lhu x7, 218(x31)
slli x6, x3, 31
sh x7, 154(x31)
srli x10, x6, 1
sw x6, 80(x31)
sw x4, 52(x31)
sh x8, 144(x31)
sb x7, 176(x31)
srl x7, x1, x1
lui x9, 585259
sh x10, 2(x31)
sh x3, 148(x31)
sh x3, 160(x31)
xori x9, x10, -1208
sw x12, 136(x31)
sh x9, 132(x31)
lw x1, 160(x31)
lui x3, 125997
sltiu x11, x10, 236
add x11, x6, x8
lui x3, 763269
auipc x30, 0
jalr x10, x30, 16
srl x2, x1, x11
lh x11, 112(x31)
sll x11, x12, x10
slti x8, x3, -1394
auipc x10, 946029
lb x6, 97(x31)
sb x11, 142(x31)
blt x7, x5, L0
andi x7, x10, 1306
srl x3, x8, x10
sh x8, 112(x31)
sw x4, 144(x31)
L0:
sh x1, 60(x31)
bne x7, x1, L1
addi x3, x4, -1886
srli x1, x10, 7
sltiu x9, x1, 834
sub x9, x2, x5
L1:
lb x11, 249(x31)
sltiu x4, x9, 1417
beq x3, x1, L2
add x12, x9, x3
sltiu x7, x10, 443
L2:
xor x7, x9, x12
sll x1, x10, x9
lw x1, 220(x31)
andi x6, x12, 1378
or x5, x2, x4
sh x9, 190(x31)
sra x12, x12, x9
auipc x12, 667712
and x12, x3, x7
bltu x7, x1, L3
L3:
sb x12, 58(x31)
slli x1, x10, 15
bltu x6, x3, L4
L4:
sll x11, x10, x7
lui x6, 877065
slti x7, x3, 1353
lw x3, 244(x31)
sb x12, 83(x31)
lhu x3, 94(x31)
and x9, x4, x9
srl x10, x10, x4
srl x4, x6, x8
sra x12, x8, x11
andi x2, x7, -1673
slt x11, x11, x4
slt x5, x10, x1
add x6, x2, x2
blt x8, x11, L5
addi x6, x7, 1932
and x12, x7, x6
L5:
beq x2, x9, L6
sb x6, 191(x31)
lh x2, 134(x31)
L6:
sw x9, 56(x31)
lw x11, 92(x31)
auipc x3, 777580
auipc x2, 226945
xor x11, x10, x5
sltiu x3, x2, -564
srai x7, x5, 17
sb x4, 245(x31)
srli x7, x2, 22
sb x11, 138(x31)
bne x10, x12, L7
L7:
sb x4, 74(x31)
sll x4, x6, x1
xori x7, x10, 488
sw x11, 152(x31)
lui x12, 4976
bge x11, x4, L8
lbu x9, 18(x31)
L8:
sb x3, 145(x31)
jal x10, L9
L9:
and x4, x8, x6
sw x10, 68(x31)
sub x12, x4, x4
lhu x2, 160(x31)
slti x12, x8, 1829
srli x4, x5, 1
lhu x3, 224(x31)
sltu x6, x8, x10
sb x3, 132(x31)
slli x4, x10, 25
auipc x3, 230832
slti x1, x7, 1622
add x4, x7, x4
slti x3, x2, 789
lui x12, 609861
lhu x8, 152(x31)
xor x11, x6, x11
and x1, x11, x3
slti x11, x6, -404
lh x6, 244(x31)
sltu x10, x7, x5
auipc x30, 0
jalr x2, x30, 20
srai x6, x7, 11
sw x9, 196(x31)
slti x6, x8, -169
lh x3, 136(x31)
lhu x1, 248(x31)
jal x8, L10
L10:
blt x11, x10, L11
L11:
andi x11, x6, -2035
beq x5, x2, L12
sb x3, 123(x31)
sb x5, 5(x31)
sb x10, 214(x31)
L12:
sb x2, 239(x31)
bltu x2, x5, L13
L13:
bge x11, x11, L14
andi x12, x10, 1602
lh x7, 226(x31)
or x1, x12, x6
L14:
addi x9, x6, 1416
or x4, x1, x7
xor x3, x4, x12
sw x4, 212(x31)
sh x10, 208(x31)
add x3, x1, x5
sra x1, x4, x7
bgeu x5, x8, L15
srl x8, x3, x12
srl x11, x3, x8
ori x4, x5, 288
L15:
lw x1, 0(x31)
lw x2, 4(x31)
lw x3, 8(x31)
lw x4, 12(x31)
lw x5, 16(x31)
lw x6, 20(x31)
lw x7, 24(x31)
lw x8, 28(x31)
end: j end
