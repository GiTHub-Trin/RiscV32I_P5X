#!/usr/bin/env python3
"""make_circuits.py - regenerates the standalone SVG circuit diagrams in docs/circuits/."""
import html, os, sys

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'docs', 'circuits')

RAMPS = {  # name: (50, 600, 800, 100/200 dark fill 800, dark stroke 200, dark title 100)
    'purple': ('#EEEDFE', '#534AB7', '#3C3489', '#3C3489', '#AFA9EC', '#CECBF6'),
    'teal':   ('#E1F5EE', '#0F6E56', '#085041', '#085041', '#5DCAA5', '#9FE1CB'),
    'gray':   ('#F1EFE8', '#5F5E5A', '#444441', '#444441', '#B4B2A9', '#D3D1C7'),
}

def style():
    s = ['<style>',
         'text{font-family:"Anthropic Sans",system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif}',
         '.bg{fill:#FFFFFF}.ts{font-size:12px;fill:#5F5E5A}.th{font-size:14px;font-weight:500;fill:#2C2C2A}',
         '.arr{stroke:#5F5E5A;stroke-width:1.5;fill:none;stroke-linecap:round;stroke-linejoin:round}',
         '.dot{fill:#5F5E5A}.mux{fill:#F1EFE8;stroke:#888780;stroke-width:1}.bub{fill:#FFFFFF;stroke:#888780;stroke-width:1}',
         '.clk{fill:none;stroke:#888780;stroke-width:1}.wire{stroke:#5F5E5A;stroke-width:1;fill:none}']
    for n, (f, st, tt, *_) in RAMPS.items():
        s.append(f'.c-{n}>rect,.c-{n}>circle{{fill:{f};stroke:{st};stroke-width:.5}}'
                 f'.c-{n}>.th{{fill:{tt}}}.c-{n}>.ts{{fill:{st}}}')
    s.append('.pla{stroke:#888780;stroke-width:1}.pd{fill:#2C2C2A}')
    s.append('@media (prefers-color-scheme:dark){.bg{fill:#1F1E1D}.ts{fill:#B4B2A9}.th{fill:#E8E6DE}'
             '.arr,.wire{stroke:#B4B2A9}.dot{fill:#B4B2A9}.mux{fill:#2C2C2A;stroke:#888780}.bub{fill:#1F1E1D;stroke:#888780}.pla{stroke:#5F5E5A}.pd{fill:#E8E6DE}')
    for n, (f, st, tt, df, ds, dt) in RAMPS.items():
        s.append(f'.c-{n}>rect,.c-{n}>circle{{fill:{df};stroke:{ds}}}.c-{n}>.th{{fill:{dt}}}.c-{n}>.ts{{fill:{ds}}}')
    s.append('}</style>')
    return ''.join(s)

MARKER = ('<defs><marker id="arrow" viewBox="0 0 10 10" refX="8" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">'
          '<path d="M2 1L8 5L2 9" fill="none" stroke="context-stroke" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></marker></defs>')

esc = lambda s: html.escape(s, quote=False)
def tm(x, y, s, c='ts'): return f'<text class="{c}" x="{x}" y="{y}" text-anchor="middle" dominant-baseline="central">{esc(s)}</text>'
def tl(x, y, s, c='ts'): return f'<text class="{c}" x="{x}" y="{y}" dominant-baseline="central">{esc(s)}</text>'
def A(x1, y1, x2, y2): return f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" class="arr" marker-end="url(#arrow)"/>'
def W(x1, y1, x2, y2): return f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" class="arr"/>'
def PA(d): return f'<path d="{d}" fill="none" class="arr" marker-end="url(#arrow)"/>'
def PW(d): return f'<path d="{d}" fill="none" class="arr"/>'
def D(x, y, r=3): return f'<circle cx="{x}" cy="{y}" r="{r}" class="dot"/>'
def BUB(x, y, r=4): return f'<circle cx="{x}" cy="{y}" r="{r}" class="bub"/>'
def M(pts): return f'<polygon points="{pts}" class="mux"/>'
def B(c, x, y, w, h, t1, t2=None, rx=4):
    cy = y + h / 2
    s = f'<g class="c-{c}"><rect x="{x}" y="{y}" width="{w}" height="{h}" rx="{rx}"/>'
    s += (tm(x + w / 2, cy - 8, t1, 'th') + tm(x + w / 2, cy + 8, t2, 'ts')) if t2 else tm(x + w / 2, cy, t1, 'th')
    return s + '</g>'
def CI(c, cx, cy, r, t): return f'<g class="c-{c}"><circle cx="{cx}" cy="{cy}" r="{r}"/>{tm(cx, cy, t, "th")}</g>'
def tri(pts): return f'<polygon points="{pts}" class="mux"/>'

def save(name, H, title, desc, body):
    svg = (f'<svg xmlns="http://www.w3.org/2000/svg" width="680" height="{H}" viewBox="0 0 680 {H}" role="img">'
           f'<title>{esc(title)}</title><desc>{esc(desc)}</desc>{style()}{MARKER}<rect class="bg" width="680" height="{H}"/>{body}</svg>')
    os.makedirs(OUT, exist_ok=True)
    with open(os.path.join(OUT, name + '.svg'), 'w') as f:
        f.write(svg)

# ---------------------------------------------------------------- 01 overview
b = ''
for i, (n, s) in enumerate([('IF', 'PC, fetch'), ('ID', 'decode, regs'), ('EX', 'ALU, branch'), ('MEM', 'load / store'), ('WB', 'write back')]):
    b += B('purple', 40 + 130 * i, 100, 90, 70, n, s, 6)
for i, name in enumerate(['IF/ID', 'ID/EX', 'EX/MEM', 'MEM/WB']):
    b += f'<g class="c-teal"><rect x="{143 + 130 * i}" y="90" width="14" height="90" rx="2"/></g>' + tm(150 + 130 * i, 78, name)
    x0 = 130 + 130 * i
    b += A(x0, 135, x0 + 11, 135) + A(x0 + 28, 135, x0 + 38, 135)
b += PA('M345 98 L345 58 L85 58 L85 98') + tm(215, 44, 'redirect PC (taken branch or jump)')
b += B('gray', 40, 250, 150, 44, 'Hazard unit', 'stall and flush', 6) + B('gray', 250, 250, 180, 44, 'Forwarding unit', 'operand bypass for EX', 6)
b += A(85, 250, 85, 174) + A(345, 250, 345, 174) + A(410, 184, 410, 248) + PA('M540 184 L540 272 L432 272')
b += PA('M605 172 L605 320 L215 320 L215 174') + tm(410, 338, 'write-back: rd, data, write enable')
save('01_pipeline_overview', 370, 'Five-stage pipeline overview',
     'Five stage blocks separated by four pipeline registers, with redirect, write-back, forwarding and hazard paths.', b)

# ---------------------------------------------------------------- 02 IF stage
b = (tl(40, 80, 'redirect_pc') + A(114, 80, 188, 80) + M('190,60 220,75 220,135 190,150') + tm(204, 83, '1') + tm(204, 131, '0')
     + tm(205, 12, 'redirect_valid') + A(205, 20, 205, 65) + D(205, 28) + PA('M205 28 L305 28 L305 36')
     + tm(325, 10, 'pc_stall') + W(325, 17, 325, 30) + BUB(325, 34, 3) + B('purple', 285, 38, 50, 22, 'OR')
     + A(310, 60, 310, 73) + A(220, 105, 268, 105) + tm(245, 94, 'pc_next') + B('teal', 270, 75, 80, 60, 'PC')
     + '<polygon points="303,135 317,135 310,127" class="clk"/>' + tm(310, 150, 'clk')
     + A(350, 105, 448, 105) + D(380, 105) + tm(416, 93, 'imem_addr') + B('teal', 450, 75, 130, 60, 'Instruction', 'memory')
     + A(580, 105, 630, 105) + tm(605, 93, 'if_instr') + A(380, 105, 380, 64) + tm(380, 50, 'if_pc')
     + W(380, 105, 380, 215) + A(380, 215, 330, 215) + CI('purple', 310, 215, 18, '+') + tm(310, 262, '4', 'th') + A(310, 254, 310, 236)
     + PA('M292 215 L170 215 L170 130 L188 130') + tm(231, 203, 'PC+4') + D(250, 215) + A(250, 215, 250, 244) + tm(250, 262, 'if_pc_plus4'))
save('02_if_stage', 290, 'Instruction fetch stage circuit',
     'PC register with next-PC mux, PC+4 adder, enable logic and instruction memory.', b)

# ---------------------------------------------------------------- 03 register file
b = (tl(40, 54, 'waddr, we') + A(104, 54, 148, 54) + B('purple', 150, 36, 160, 38, 'Write decoder', 'we and waddr not 0') + A(230, 74, 230, 93)
     + '<g class="c-teal"><rect x="180" y="95" width="100" height="90" rx="4"/>' + tm(230, 122, 'Register', 'th') + tm(230, 140, 'array', 'th') + tm(230, 162, 'x1 to x31') + '</g>'
     + tl(40, 140, 'wdata') + A(80, 140, 178, 140) + D(130, 140)
     + tm(340, 28, 'raddr1') + A(340, 36, 340, 102) + M('320,95 360,110 360,170 320,185') + tm(338, 145, '32:1')
     + A(280, 140, 318, 140) + A(360, 140, 418, 140) + M('420,112 450,122 450,172 420,182') + tm(434, 146, '0') + tm(434, 166, '1')
     + PA('M130 140 L130 215 L405 215 L405 162 L418 162') + A(435, 245, 435, 178)
     + B('purple', 320, 245, 180, 36, 'we and waddr == raddr1') + A(410, 300, 410, 283) + tm(410, 314, 'we, waddr, raddr1')
     + A(450, 147, 498, 147) + B('purple', 500, 127, 40, 40, 'AND') + B('purple', 510, 245, 110, 36, 'raddr1 not 0')
     + A(520, 245, 520, 169) + A(565, 300, 565, 283) + tm(565, 314, 'raddr1') + A(540, 147, 630, 147) + tm(606, 134, 'rdata1')
     + tm(340, 348, 'Port 2 is an identical copy driven by raddr2, producing rdata2'))
save('03_register_file', 370, 'Register file circuit',
     'Write decoder and register array, with read port 1 showing the 32-to-1 mux, write-through bypass and x0 zero gating.', b)

# ---------------------------------------------------------------- 04 imm_gen
rows = [('I', '{20{i31}, i[31:20]}'), ('S', '{20{i31}, i[31:25], i[11:7]}'), ('B', '{20{i31}, i7, i[30:25], i[11:8], 0}'),
        ('U', "{i[31:12], 12'b0}"), ('J', '{12{i31}, i[19:12], i20, i[30:21], 0}')]
b = ''
for i, (k, t) in enumerate(rows):
    y = 40 + 50 * i
    b += f'<g class="c-purple"><rect x="40" y="{y}" width="330" height="36" rx="4"/>{tl(54, y + 18, k, "th")}{tl(84, y + 18, t)}</g>' + A(370, y + 18, 448, y + 18)
b += (M('450,40 490,70 490,250 450,280') + tm(470, 160, '5:1') + A(490, 160, 598, 160) + tl(606, 160, 'imm') + A(470, 310, 470, 266)
      + B('gray', 400, 310, 140, 38, 'Opcode decode', 'default is I-type') + tl(296, 329, 'instr[6:0]') + A(360, 329, 398, 329))
save('04_immediate_generator', 370, 'Immediate generator circuit',
     'Five bit-rearrangement networks for I, S, B, U and J formats feeding a 5-to-1 mux selected by an opcode decoder.', b)

# ---------------------------------------------------------------- 05 control PLA
cols = ['OP', 'OPIMM', 'LOAD', 'STORE', 'BRANCH', 'LUI', 'AUIPC', 'JAL', 'JALR']
table = [('reg_write', [0, 1, 2, 5, 6, 7, 8]), ('wb=MEM', [2]), ('wb=PC4', [7, 8]), ('mem_read', [2]), ('mem_write', [3]),
         ('src_b=IMM', [1, 2, 3, 5, 6, 8]), ('src_a=PC', [6]), ('src_a=ZERO', [5]), ('branch', [4]), ('jal', [7]), ('jalr', [8]),
         ('uses_rs1', [0, 1, 2, 3, 4, 8]), ('uses_rs2', [0, 3, 4]), ('alu_op[1]', [0, 1]), ('alu_op[0]', [1])]
cx = lambda i: 190 + 46 * i
b = tl(40, 48, 'instr[6:0]') + A(104, 48, 168, 48) + B('purple', 170, 34, 408, 28, 'Opcode decoder: one-hot lines')
for i, c in enumerate(cols):
    b += f'<line x1="{cx(i)}" y1="88" x2="{cx(i)}" y2="416" class="pla"/>' + tm(cx(i), 76, c)
for r, (name, dots) in enumerate(table):
    y = 100 + 22 * r
    b += f'<line x1="170" y1="{y}" x2="576" y2="{y}" class="pla"/>' + tl(584, y, name)
    b += ''.join(f'<circle cx="{cx(i)}" cy="{y}" r="3.5" class="pd"/>' for i in dots)
save('05_control_unit_pla', 440, 'Control unit PLA circuit',
     'A matrix with one-hot opcode columns and control signal rows; dots mark which opcodes assert each signal.', b)

# ---------------------------------------------------------------- 06 ALU control
ops = [('ADD | SUB', 'purple'), ('SLL', 'gray'), ('SLT', 'gray'), ('SLTU', 'gray'), ('XOR', 'gray'), ('SRL | SRA', 'purple'), ('OR', 'gray'), ('AND', 'gray')]
b = (tl(40, 60, 'R & f7[5]') + A(102, 60, 148, 60) + tl(40, 230, 'f7[5]') + A(78, 230, 148, 230))
for i, (n, c) in enumerate(ops):
    y = 60 + 34 * i
    b += B(c, 150, y - 12, 100, 24, n) + tm(290, y - 8, format(i, '03b')) + A(250, y, 328, y)
b += (M('330,50 370,80 370,280 330,310') + tm(350, 180, '8:1') + A(350, 345, 350, 297) + tm(350, 360, 'funct3')
      + PA('M370 180 L400 180 L400 168 L428 168') + B('gray', 380, 190, 38, 20, 'ADD') + A(418, 200, 428, 200)
      + M('430,150 460,160 460,200 430,210') + tm(446, 172, '1') + tm(446, 192, '0') + A(445, 262, 445, 206) + tm(445, 276, 'alu_op[1]')
      + A(460, 180, 558, 180) + tl(566, 180, 'alu_ctrl'))
save('06_alu_control', 385, 'ALU control decoder circuit',
     'An 8-to-1 mux selected by funct3 with ADD/SUB and SRL/SRA sub-muxes, followed by a mux that forces ADD when alu_op is zero.', b)

# ---------------------------------------------------------------- 07 ALU
alu_ops = [('ADD', 'a + b'), ('SUB', 'a - b'), ('SLL', 'a << b[4:0]'), ('SLT', 'a < b (signed)'), ('SLTU', 'a < b (unsigned)'),
           ('XOR', 'a ^ b'), ('SRL', 'a >> b[4:0]'), ('SRA', 'a >>> b[4:0]'), ('OR', 'a | b'), ('AND', 'a & b')]
b = tm(60, 20, 'a', 'th') + tm(100, 20, 'b', 'th') + W(60, 32, 60, 334) + W(100, 32, 100, 346)
for i, (n, e) in enumerate(alu_ops):
    y = 40 + 32 * i; yc = y + 12
    b += f'<g class="c-purple"><rect x="150" y="{y}" width="180" height="24" rx="4"/>{tl(162, yc, n, "th")}{tl(212, yc, e)}</g>'
    b += f'<line x1="60" y1="{yc - 6}" x2="148" y2="{yc - 6}" class="wire"/><line x1="100" y1="{yc + 6}" x2="148" y2="{yc + 6}" class="wire"/>'
    b += D(60, yc - 6, 2.5) + D(100, yc + 6, 2.5) + A(330, yc, 408, yc)
b += M('410,30 450,60 450,332 410,362') + tm(430, 196, '10:1') + A(450, 196, 570, 196) + tl(578, 196, 'result') + A(430, 398, 430, 346) + tm(430, 412, 'alu_ctrl')
save('07_alu', 440, 'ALU circuit',
     'Operands a and b feed ten parallel operation blocks whose outputs are selected by a 10-to-1 mux driven by alu_ctrl.', b)

# ---------------------------------------------------------------- 08 EX operand path
b = (tl(40, 72, 'rs1_data') + tl(40, 90, 'mem_fwd') + tl(40, 108, 'wb_data') + A(98, 72, 138, 72) + A(98, 90, 138, 90) + A(98, 108, 138, 108)
     + M('140,55 170,65 170,115 140,125') + tm(154, 76, '0') + tm(154, 90, '1') + tm(154, 104, '2') + tm(155, 30, 'fwd_a') + A(155, 38, 155, 61)
     + W(170, 90, 200, 90) + D(200, 90) + PA('M200 90 L200 72 L248 72') + tl(207, 94, 'pc') + A(226, 90, 248, 90) + tl(222, 108, '0') + A(232, 108, 248, 108)
     + M('250,55 280,65 280,115 250,125') + tm(265, 30, 'alu_src_a') + A(265, 38, 265, 61) + PA('M280 90 L320 90 L320 135 L348 135')
     + B('purple', 350, 120, 80, 60, 'ALU') + A(390, 226, 390, 182) + tm(390, 240, 'alu_ctrl') + A(430, 150, 560, 150) + tl(568, 150, 'alu_result')
     + tl(40, 192, 'rs2_data') + tl(40, 210, 'mem_fwd') + tl(40, 228, 'wb_data') + A(98, 192, 138, 192) + A(98, 210, 138, 210) + A(98, 228, 138, 228)
     + M('140,175 170,185 170,235 140,245') + tm(154, 194, '0') + tm(154, 210, '1') + tm(154, 226, '2') + A(155, 275, 155, 241) + tm(155, 288, 'fwd_b')
     + W(170, 210, 190, 210) + D(190, 210) + PA('M190 210 L190 200 L248 200') + tl(210, 222, 'imm') + A(236, 222, 248, 222)
     + M('250,185 280,195 280,235 250,245') + A(265, 275, 265, 241) + tm(265, 288, 'alu_src_b') + PA('M280 210 L310 210 L310 165 L348 165')
     + PA('M190 210 L190 300 L558 300') + tl(568, 300, 'store_data'))
save('08_ex_operand_path', 330, 'EX stage operand path circuit',
     'Forwarding muxes for rs1 and rs2, ALU operand muxes, the ALU, and the store data tap.', b)

# ---------------------------------------------------------------- 09 branch + target
b = (tm(60, 18, 'rs1_f', 'th') + tm(92, 18, 'rs2_f', 'th') + W(60, 30, 60, 178) + W(92, 30, 92, 190)
     + B('purple', 140, 40, 90, 24, 'a == b') + B('purple', 140, 128, 90, 24, 'a < b signed') + B('purple', 140, 172, 90, 24, 'a < b unsigned'))
for (ya, yb) in [(46, 58), (134, 146), (178, 190)]:
    b += f'<line x1="60" y1="{ya}" x2="138" y2="{ya}" class="wire"/><line x1="92" y1="{yb}" x2="138" y2="{yb}" class="wire"/>' + D(60, ya, 2.5) + D(92, yb, 2.5)
b += A(230, 52, 328, 52) + A(230, 140, 328, 140) + A(230, 184, 328, 184) + D(265, 52) + D(265, 140) + D(265, 184)
for y0, y1 in [(52, 74), (140, 162), (184, 206)]:
    b += PW(f'M265 {y0} L265 {y1} L285 {y1}') + BUB(289, y1) + A(293, y1, 328, y1)
b += tl(302, 96, '0') + A(312, 96, 328, 96) + tl(302, 118, '0') + A(312, 118, 328, 118)
b += (M('330,40 370,60 370,220 330,240') + tm(350, 140, '8:1') + A(350, 272, 350, 231) + tm(350, 286, 'funct3') + A(370, 140, 418, 140)
      + B('purple', 420, 120, 40, 40, 'AND') + tm(440, 98, 'branch') + A(440, 106, 440, 118) + PA('M460 140 L480 140 L480 130 L498 130')
      + B('purple', 500, 118, 45, 60, 'OR') + tm(515, 203, 'jal') + A(515, 195, 515, 180) + tm(537, 225, 'jalr') + A(537, 217, 537, 180)
      + A(545, 148, 620, 148) + tm(600, 166, 'redirect_valid') + tl(40, 312, 'Jump and branch target')
      + tl(100, 332, 'pc') + tl(100, 348, 'imm') + A(122, 332, 212, 332) + A(126, 348, 212, 348) + CI('purple', 230, 340, 18, '+')
      + A(248, 340, 328, 340) + tl(150, 382, '{alu_result[31:1], 0}') + A(280, 382, 328, 382) + M('330,320 360,330 360,390 330,400')
      + tm(344, 344, '0') + tm(344, 376, '1') + A(345, 428, 345, 397) + tm(345, 442, 'jalr') + A(360, 360, 440, 360) + tl(448, 360, 'redirect_pc'))
save('09_branch_and_target', 470, 'Branch unit and target circuit',
     'Equality, signed and unsigned comparators with inverted copies feed an 8-to-1 mux selected by funct3, gated by branch and ORed with jal and jalr to form redirect_valid; a pc plus imm adder and a JALR mux form redirect_pc.', b)

# ---------------------------------------------------------------- 10 forwarding unit
b = ''
for dy, src, wr in [(0, 'mem_rd', 'mem_reg_write'), (130, 'wb_rd', 'wb_reg_write')]:
    b += (tl(40, 55 + dy, src) + tl(40, 75 + dy, 'ex_rs1') + A(92, 55 + dy, 138, 55 + dy) + A(92, 75 + dy, 138, 75 + dy)
          + B('purple', 140, 45 + dy, 60, 40, '==') + tl(40, 107 + dy, src) + A(92, 107 + dy, 138, 107 + dy) + B('purple', 140, 95 + dy, 60, 24, 'not 0')
          + tl(40, 127 + dy, wr) + A(126 if dy == 0 else 120, 127 + dy, 248, 127 + dy) + A(200, 65 + dy, 248, 65 + dy) + A(200, 107 + dy, 248, 107 + dy)
          + B('purple', 250, 45 + dy, 50, 92, 'AND'))
b += (tl(342, 190, '0') + W(352, 190, 358, 190) + tl(342, 220, '2') + W(352, 220, 358, 220) + M('360,170 390,180 390,230 360,240')
      + PA('M300 221 L325 221 L325 262 L375 262 L375 236') + tm(350, 276, 'hit_wb') + PA('M390 205 L430 205 L430 160 L468 160')
      + tl(446, 135, '1') + A(456, 135, 468, 135) + M('470,110 500,120 500,170 470,180') + PA('M300 91 L485 91 L485 116') + tm(390, 78, 'hit_mem')
      + A(500, 145, 598, 145) + tl(606, 145, 'fwd_a') + tm(340, 316, 'fwd_b is identical, driven by ex_rs2'))
save('10_forwarding_unit', 335, 'Forwarding unit circuit for operand A',
     'Two hit detectors, one for EX/MEM and one for MEM/WB, each combining a register comparator, a non-zero check and a write enable; two chained muxes give EX/MEM priority.', b)

# ---------------------------------------------------------------- 11 hazard unit
b = (tl(30, 53, 'ex_rd') + tl(30, 67, 'id_rs1') + A(76, 53, 118, 53) + A(80, 67, 118, 67) + B('purple', 120, 45, 50, 30, '==') + A(170, 60, 208, 60)
     + B('purple', 210, 48, 40, 44, 'AND') + tm(230, 112, 'uses_rs1') + A(230, 104, 230, 94)
     + tl(30, 143, 'ex_rd') + tl(30, 157, 'id_rs2') + A(76, 143, 118, 143) + A(80, 157, 118, 157) + B('purple', 120, 135, 50, 30, '==') + A(170, 150, 208, 150)
     + B('purple', 210, 138, 40, 44, 'AND') + tm(230, 212, 'uses_rs2') + A(230, 204, 230, 184)
     + PA('M250 70 L275 70 L275 110 L298 110') + PA('M250 160 L275 160 L275 130 L298 130') + B('purple', 300, 95, 40, 50, 'OR')
     + PA('M340 120 L370 120 L370 130 L398 130') + tm(425, 64, 'ex_mem_read') + A(425, 72, 425, 89) + B('purple', 400, 90, 50, 80, 'AND')
     + B('purple', 375, 195, 100, 24, 'ex_rd not 0') + A(425, 195, 425, 172) + tm(425, 236, 'ex_rd') + A(425, 230, 425, 221)
     + W(450, 130, 480, 130) + W(480, 100, 480, 175) + D(480, 130) + D(480, 140) + A(480, 100, 578, 100) + tl(586, 100, 'pc_stall')
     + W(480, 140, 497, 140) + '<polygon points="499,130 499,150 517,140" class="mux"/>' + BUB(521, 140) + A(525, 140, 578, 140) + tl(586, 140, 'if_id_en')
     + A(480, 175, 497, 175) + B('purple', 499, 165, 40, 40, 'OR') + A(539, 185, 578, 185) + tl(586, 185, 'id_ex_flush')
     + tm(350, 262, 'ex_redirect') + A(402, 262, 578, 262) + D(519, 262) + A(519, 262, 519, 207) + tl(586, 262, 'if_id_flush'))
save('11_hazard_unit', 285, 'Hazard unit circuit',
     'Two comparators with uses_rs gating, an OR, and a three-input AND with ex_mem_read and a non-zero check produce load_use, which drives pc_stall, if_id_en and id_ex_flush; ex_redirect drives the flushes.', b)

# ---------------------------------------------------------------- 12 MEM stage
b = tl(40, 86, 'store_data') + W(52, 98, 52, 181)
for y, t in [(125, 'SB {4{d[7:0]}}'), (153, 'SH {2{d[15:0]}}'), (181, 'SW d')]:
    b += D(52, y) + A(52, y, 68, y) + f'<g class="c-purple"><rect x="70" y="{y - 11}" width="120" height="22" rx="4"/>{tm(130, y, t)}</g>' + A(190, y, 213, y)
b += (M('215,110 245,122 245,184 215,196') + A(230, 222, 230, 191) + tm(230, 236, 'funct3[1:0]') + A(245, 153, 268, 153)
      + tm(310, 62, 'dmem_addr') + A(310, 70, 310, 98) + B('teal', 270, 100, 80, 100, 'Data', 'memory')
      + B('purple', 120, 260, 180, 40, 'Byte-enable decode') + A(210, 330, 210, 302) + tm(210, 344, 'mem_write, funct3[1:0], addr[1:0]')
      + PA('M300 280 L320 280 L320 202') + tl(330, 236, 'dmem_we[3:0]') + A(350, 150, 383, 150) + tm(366, 138, 'rdata')
      + B('purple', 385, 135, 90, 30, 'shift by off') + tm(430, 98, 'addr[1:0]') + A(430, 106, 430, 133) + A(475, 150, 508, 150)
      + B('purple', 510, 125, 100, 50, 'Extend + mux', 'by funct3') + A(560, 207, 560, 177) + tm(560, 220, 'funct3')
      + A(610, 150, 640, 150) + tm(642, 128, 'load_data')
      + tl(372, 268, 'alu_result') + A(436, 268, 448, 268) + tl(372, 294, 'pc_plus4') + A(424, 294, 448, 294) + M('450,250 480,260 480,300 450,310')
      + A(465, 326, 465, 306) + tm(465, 340, 'wb_sel is PC4') + A(480, 280, 560, 280) + tl(568, 280, 'fwd_data'))
save('12_mem_stage', 365, 'MEM stage circuit',
     'Store data replication muxed by size into the data memory with a byte-enable decoder, a load path that shifts by the byte offset then extends and selects by funct3, and a forwarding value mux.', b)

# ---------------------------------------------------------------- 13 pipeline reg + WB
b = (tl(40, 100, 'D in') + A(70, 100, 118, 100) + M('120,85 150,95 150,135 120,145') + tm(134, 104, '1') + tm(134, 132, '0')
     + tm(135, 40, 'en') + A(135, 48, 135, 91) + PA('M150 115 L165 115 L165 100 L178 100') + M('180,85 210,95 210,135 180,145')
     + tm(194, 104, '0') + tm(194, 132, '1') + tm(160, 130, '0') + A(166, 130, 178, 130) + tm(195, 40, 'flush or rst') + A(195, 48, 195, 91)
     + A(210, 115, 258, 115) + B('teal', 260, 95, 60, 60, 'FF') + '<polygon points="283,155 297,155 290,147" class="clk"/>' + tm(290, 170, 'clk')
     + A(320, 115, 360, 115) + tm(352, 102, 'Q') + D(340, 115) + PA('M340 115 L340 190 L105 190 L105 130 L118 130')
     + tl(450, 110, 'alu_result') + tl(450, 135, 'load_data') + tl(450, 160, 'pc_plus4') + A(514, 110, 558, 110) + A(512, 135, 558, 135) + A(502, 160, 558, 160)
     + M('560,90 590,100 590,170 560,180') + tm(570, 112, '0') + tm(570, 135, '1') + tm(570, 158, '2') + A(575, 205, 575, 176) + tm(575, 218, 'wb_sel')
     + A(590, 135, 630, 135) + tm(626, 118, 'wb_data') + tm(215, 240, 'One bit of a pipeline register') + tm(545, 248, 'Write-back mux'))
save('13_pipeline_register_and_wb', 265, 'Pipeline register bit and write-back mux circuit',
     'A flip-flop with an enable hold mux and a flush or reset mux, and a three-input write-back mux selecting ALU result, load data or PC plus 4.', b)

# ---------------------------------------------------------------- gallery
files = sorted(f for f in os.listdir(OUT) if f.endswith('.svg'))
cards = ''.join(f'<section><h2>{f[3:-4].replace("_", " ").capitalize()}</h2><img src="{f}" alt="{f[3:-4].replace("_", " ")}"></section>' for f in files)
with open(os.path.join(OUT, 'index.html'), 'w') as fh:
    fh.write('<!doctype html><meta charset="utf-8"><title>RV32I pipeline circuits</title>'
             '<style>body{font-family:system-ui,sans-serif;max-width:760px;margin:2rem auto;padding:0 1rem;background:#fff;color:#222}'
             'h2{font-size:18px;font-weight:500;margin:2rem 0 .5rem}img{width:100%;border:1px solid #ddd;border-radius:8px}'
             '@media(prefers-color-scheme:dark){body{background:#1F1E1D;color:#eee}img{border-color:#444}}</style>'
             '<h1 style="font-weight:500">RV32I 5-stage pipeline: circuit diagrams</h1>' + cards)
print(len(files), 'diagrams written to', os.path.normpath(OUT))
