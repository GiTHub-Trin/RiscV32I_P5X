#!/usr/bin/env python3
"""
rvasm.py - tiny RV32I assembler (no relocations, single section at address 0).

Usage:  rvasm.py prog.s [-o prog.hex]

Supported
  R : add sub sll slt sltu xor srl sra or and
  I : addi slti sltiu xori ori andi slli srli srai
  L : lb lh lw lbu lhu        (rd, imm(rs1))
  S : sb sh sw                (rs2, imm(rs1))
  B : beq bne blt bge bltu bgeu  (rs1, rs2, label)
  U : lui auipc               (rd, imm20)
  J : jal [rd,] label    jalr rd, imm(rs1) | jalr rd, rs1, imm | jalr rs1
  pseudo: nop li mv not neg j jr ret beqz bnez
Comments: '#' or '//'.  Labels: 'name:'.
Output: one 32-bit hex word per line ($readmemh format).
"""
import re
import sys

ABI = {'zero': 0, 'ra': 1, 'sp': 2, 'gp': 3, 'tp': 4, 't0': 5, 't1': 6, 't2': 7,
       's0': 8, 'fp': 8, 's1': 9}
ABI.update({f'a{i}': 10 + i for i in range(8)})
ABI.update({f's{i}': 16 + i for i in range(2, 12)})
ABI.update({f't{i}': 25 + i for i in range(3, 7)})

R_F = {'add': (0, 0), 'sub': (0x20, 0), 'sll': (0, 1), 'slt': (0, 2), 'sltu': (0, 3),
       'xor': (0, 4), 'srl': (0, 5), 'sra': (0x20, 5), 'or': (0, 6), 'and': (0, 7)}
I_F = {'addi': 0, 'slti': 2, 'sltiu': 3, 'xori': 4, 'ori': 6, 'andi': 7}
SH_F = {'slli': (0, 1), 'srli': (0, 5), 'srai': (0x20, 5)}
L_F = {'lb': 0, 'lh': 1, 'lw': 2, 'lbu': 4, 'lhu': 5}
S_F = {'sb': 0, 'sh': 1, 'sw': 2}
B_F = {'beq': 0, 'bne': 1, 'blt': 4, 'bge': 5, 'bltu': 6, 'bgeu': 7}


def reg(tok):
    tok = tok.strip()
    if tok in ABI:
        return ABI[tok]
    m = re.fullmatch(r'x(\d+)', tok)
    if m and 0 <= int(m.group(1)) < 32:
        return int(m.group(1))
    raise ValueError(f'bad register {tok!r}')


def num(tok):
    return int(tok.strip(), 0)


def sext(v, bits):
    v &= (1 << bits) - 1
    return v - (1 << bits) if v >> (bits - 1) else v


def mem_operand(tok):
    m = re.fullmatch(r'\s*(-?\w+)?\s*\(\s*(\w+)\s*\)\s*', tok)
    if not m:
        raise ValueError(f'bad memory operand {tok!r}')
    return num(m.group(1)) if m.group(1) else 0, reg(m.group(2))


def r_t(f7, rs2, rs1, f3, rd, op):
    return (f7 << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | op


def i_t(imm, rs1, f3, rd, op):
    assert -2048 <= imm <= 2047, f'I-imm out of range: {imm}'
    return ((imm & 0xfff) << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | op


def s_t(imm, rs2, rs1, f3, op):
    assert -2048 <= imm <= 2047, f'S-imm out of range: {imm}'
    imm &= 0xfff
    return ((imm >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | ((imm & 0x1f) << 7) | op


def b_t(imm, rs2, rs1, f3, op):
    assert -4096 <= imm <= 4094 and imm % 2 == 0, f'B-imm out of range: {imm}'
    imm &= 0x1fff
    return (((imm >> 12) & 1) << 31) | (((imm >> 5) & 0x3f) << 25) | (rs2 << 20) | (rs1 << 15) | \
           (f3 << 12) | (((imm >> 1) & 0xf) << 8) | (((imm >> 11) & 1) << 7) | op


def u_t(imm, rd, op):
    return ((imm & 0xfffff) << 12) | (rd << 7) | op


def j_t(imm, rd, op):
    assert -(1 << 20) <= imm < (1 << 20) and imm % 2 == 0, f'J-imm out of range: {imm}'
    imm &= 0x1fffff
    return (((imm >> 20) & 1) << 31) | (((imm >> 1) & 0x3ff) << 21) | (((imm >> 11) & 1) << 20) | \
           (((imm >> 12) & 0xff) << 12) | (rd << 7) | op


def li_parts(v):
    """Return list of ('addi'|'lui', imm) for loading constant v."""
    v &= 0xffffffff
    sv = v - (1 << 32) if v >> 31 else v
    if -2048 <= sv <= 2047:
        return [('addi0', sv)]
    lo = sext(v, 12)
    hi = ((v - lo) >> 12) & 0xfffff
    parts = [('lui', hi)]
    if lo:
        parts.append(('addi', lo))
    return parts


def split_ops(s):
    return [t.strip() for t in s.split(',')] if s.strip() else []


def parse(src):
    """Pass 1: expand pseudos, collect labels. Returns (items, labels)."""
    items, labels = [], {}
    for ln, raw in enumerate(src.splitlines(), 1):
        line = re.split(r'#|//', raw)[0].strip()
        while True:
            m = re.match(r'([A-Za-z_.][\w.]*)\s*:\s*(.*)', line)
            if not m:
                break
            labels[m.group(1)] = len(items) * 4
            line = m.group(2).strip()
        if not line:
            continue
        parts = line.split(None, 1)
        mn, ops = parts[0].lower(), split_ops(parts[1] if len(parts) > 1 else '')
        try:
            if mn == 'nop':
                items.append(('addi', ['x0', 'x0', '0'], ln))
            elif mn == 'li':
                for kind, imm in li_parts(num(ops[1])):
                    if kind == 'addi0':
                        items.append(('addi', [ops[0], 'x0', str(imm)], ln))
                    elif kind == 'lui':
                        items.append(('lui', [ops[0], str(imm)], ln))
                    else:
                        items.append(('addi', [ops[0], ops[0], str(imm)], ln))
            elif mn == 'mv':
                items.append(('addi', [ops[0], ops[1], '0'], ln))
            elif mn == 'not':
                items.append(('xori', [ops[0], ops[1], '-1'], ln))
            elif mn == 'neg':
                items.append(('sub', [ops[0], 'x0', ops[1]], ln))
            elif mn == 'j':
                items.append(('jal', ['x0', ops[0]], ln))
            elif mn == 'jr':
                items.append(('jalr', ['x0', '0(' + ops[0] + ')'], ln))
            elif mn == 'ret':
                items.append(('jalr', ['x0', '0(ra)'], ln))
            elif mn == 'beqz':
                items.append(('beq', [ops[0], 'x0', ops[1]], ln))
            elif mn == 'bnez':
                items.append(('bne', [ops[0], 'x0', ops[1]], ln))
            elif mn == 'jal' and len(ops) == 1:
                items.append(('jal', ['ra', ops[0]], ln))
            else:
                items.append((mn, ops, ln))
        except (IndexError, ValueError) as e:
            raise SystemExit(f'line {ln}: {e}: {raw!r}')
    return items, labels


def target(tok, labels, pc):
    if tok in labels:
        return labels[tok] - pc
    return num(tok)


def encode(items, labels):
    words = []
    for idx, (mn, ops, ln) in enumerate(items):
        pc = idx * 4
        try:
            if mn in R_F:
                f7, f3 = R_F[mn]
                w = r_t(f7, reg(ops[2]), reg(ops[1]), f3, reg(ops[0]), 0x33)
            elif mn in I_F:
                w = i_t(num(ops[2]), reg(ops[1]), I_F[mn], reg(ops[0]), 0x13)
            elif mn in SH_F:
                f7, f3 = SH_F[mn]
                sh = num(ops[2])
                assert 0 <= sh < 32
                w = r_t(f7, sh, reg(ops[1]), f3, reg(ops[0]), 0x13)
            elif mn in L_F:
                imm, rs1 = mem_operand(ops[1])
                w = i_t(imm, rs1, L_F[mn], reg(ops[0]), 0x03)
            elif mn in S_F:
                imm, rs1 = mem_operand(ops[1])
                w = s_t(imm, reg(ops[0]), rs1, S_F[mn], 0x23)
            elif mn in B_F:
                w = b_t(target(ops[2], labels, pc), reg(ops[1]), reg(ops[0]), B_F[mn], 0x63)
            elif mn == 'lui':
                w = u_t(num(ops[1]), reg(ops[0]), 0x37)
            elif mn == 'auipc':
                w = u_t(num(ops[1]), reg(ops[0]), 0x17)
            elif mn == 'jal':
                w = j_t(target(ops[1], labels, pc), reg(ops[0]), 0x6f)
            elif mn == 'jalr':
                if len(ops) == 2:
                    imm, rs1 = mem_operand(ops[1])
                elif len(ops) == 3:
                    rs1, imm = reg(ops[1]), num(ops[2])
                else:
                    rs1, imm = reg(ops[0]), 0
                    ops = ['ra'] + ops
                w = i_t(imm, rs1, 0, reg(ops[0]), 0x67)
            else:
                raise ValueError(f'unknown mnemonic {mn!r}')
        except (AssertionError, IndexError, ValueError) as e:
            raise SystemExit(f'line {ln}: {e}')
        words.append(w & 0xffffffff)
    return words


def assemble(src):
    items, labels = parse(src)
    return encode(items, labels)


def main():
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    inp = sys.argv[1]
    out = sys.argv[sys.argv.index('-o') + 1] if '-o' in sys.argv else inp.rsplit('.', 1)[0] + '.hex'
    words = assemble(open(inp).read())
    with open(out, 'w') as f:
        for w in words:
            f.write(f'{w:08x}\n')
    print(f'{inp}: {len(words)} instructions -> {out}')


if __name__ == '__main__':
    main()
