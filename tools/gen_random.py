#!/usr/bin/env python3
"""
gen_random.py - constrained-random RV32I program generator (hazard stress).

Usage: gen_random.py SEED [N_INSTR] > prog.s

* Uses a small register pool (x1..x12) so RAW hazards of every distance occur.
* x31 is the (constant, 0) data base register; loads/stores stay in [0, 256).
* Control flow is forward-only (branches, JAL, AUIPC+JALR) so programs always
  terminate in the final `j .`.
"""
import random
import sys

POOL = [f'x{i}' for i in range(1, 13)]
R_OPS = ['add', 'sub', 'sll', 'slt', 'sltu', 'xor', 'srl', 'sra', 'or', 'and']
I_OPS = ['addi', 'slti', 'sltiu', 'xori', 'ori', 'andi']
SH_OPS = ['slli', 'srli', 'srai']
B_OPS = ['beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu']


def main():
    seed = int(sys.argv[1])
    n = int(sys.argv[2]) if len(sys.argv) > 2 else 150
    rnd = random.Random(seed)
    out = [f'# random program, seed {seed}']
    lab = [0]

    def rr():
        return rnd.choice(POOL + ['x0'] if rnd.random() < 0.08 else POOL)

    def rd():
        return rnd.choice(POOL)

    def simple():
        k = rnd.random()
        if k < 0.30:
            return f'{rnd.choice(R_OPS)} {rd()}, {rr()}, {rr()}'
        if k < 0.50:
            return f'{rnd.choice(I_OPS)} {rd()}, {rr()}, {rnd.randint(-2048, 2047)}'
        if k < 0.58:
            return f'{rnd.choice(SH_OPS)} {rd()}, {rr()}, {rnd.randint(0, 31)}'
        if k < 0.63:
            return f'lui {rd()}, {rnd.randint(0, 0xfffff)}'
        if k < 0.67:
            return f'auipc {rd()}, {rnd.randint(0, 0xfffff)}'
        if k < 0.82:
            op = rnd.choice(['lb', 'lbu', 'lh', 'lhu', 'lw'])
            al = {'lb': 1, 'lbu': 1, 'lh': 2, 'lhu': 2, 'lw': 4}[op]
            off = rnd.randrange(0, 256, al)
            return f'{op} {rd()}, {off}(x31)'
        op = rnd.choice(['sb', 'sh', 'sw'])
        al = {'sb': 1, 'sh': 2, 'sw': 4}[op]
        off = rnd.randrange(0, 256, al)
        return f'{op} {rr()}, {off}(x31)'

    # init registers with random constants
    for r in POOL:
        out.append(f'li {r}, {rnd.randint(-2**31, 2**31 - 1)}')
    out.append('li x31, 0')

    i = 0
    while i < n:
        k = rnd.random()
        if k < 0.12:                                   # forward branch
            l = f'L{lab[0]}'; lab[0] += 1
            skip = rnd.randint(0, 4)
            out.append(f'{rnd.choice(B_OPS)} {rr()}, {rr()}, {l}')
            for _ in range(skip):
                out.append(simple())
            out.append(f'{l}:')
            i += skip + 1
        elif k < 0.16:                                 # forward JAL
            l = f'L{lab[0]}'; lab[0] += 1
            skip = rnd.randint(0, 3)
            out.append(f'jal {rnd.choice(POOL + ["x0"])}, {l}')
            for _ in range(skip):
                out.append(simple())
            out.append(f'{l}:')
            i += skip + 1
        elif k < 0.20:                                 # AUIPC + JALR forward
            skip = rnd.randint(0, 3)
            out.append('auipc x30, 0')
            out.append(f'jalr {rnd.choice(POOL + ["x0"])}, x30, {8 + 4 * skip}')
            for _ in range(skip):
                out.append(simple())
            i += skip + 2
        else:
            out.append(simple())
            i += 1

    # read back the data region so memory contents are observable in the regs
    for j, r in enumerate(POOL[:8]):
        out.append(f'lw {r}, {j * 4}(x31)')
    out.append('end: j end')
    print('\n'.join(out))


if __name__ == '__main__':
    main()
