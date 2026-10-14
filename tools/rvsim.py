#!/usr/bin/env python3
"""
rvsim.py - RV32I instruction-set simulator used as the golden model.

Usage:  rvsim.py prog.hex [-o expected_regs.hex] [--max-steps N]

Runs until it executes a jump-to-self (`j .`, 0x0000006f) and writes the
final x0..x31 as 32 hex words, which tb_riscv_core.v compares with the RTL.
Data memory: 4 KiB, little-endian, zero-initialised (matches rtl/memory/dmem.v).
"""
import sys

M32 = 0xffffffff
DMEM_BYTES = 4096


def s32(x):
    x &= M32
    return x - (1 << 32) if x >> 31 else x


def sext(v, bits):
    v &= (1 << bits) - 1
    return v - (1 << bits) if v >> (bits - 1) else v


def run(words, max_steps=200000):
    regs = [0] * 32
    mem = bytearray(DMEM_BYTES)
    pc = 0
    steps = 0

    def rd_mem(addr, n):
        if addr + n > DMEM_BYTES:
            return 0
        return int.from_bytes(mem[addr:addr + n], 'little')

    def wr_mem(addr, n, val):
        if addr + n > DMEM_BYTES:
            return
        mem[addr:addr + n] = (val & ((1 << (8 * n)) - 1)).to_bytes(n, 'little')

    while steps < max_steps:
        idx = pc >> 2
        ins = words[idx] if (pc & 3) == 0 and 0 <= idx < len(words) else 0x13
        if ins == 0x0000006f:
            return regs, steps
        steps += 1
        op = ins & 0x7f
        rd = (ins >> 7) & 31
        f3 = (ins >> 12) & 7
        rs1 = (ins >> 15) & 31
        rs2 = (ins >> 20) & 31
        f7 = ins >> 25
        a, b = regs[rs1], regs[rs2]
        sa, sb = s32(a), s32(b)
        imm_i = sext(ins >> 20, 12)
        imm_s = sext(((ins >> 25) << 5) | rd, 12)
        imm_b = sext((((ins >> 31) & 1) << 12) | (((ins >> 7) & 1) << 11) |
                     (((ins >> 25) & 0x3f) << 5) | (((ins >> 8) & 0xf) << 1), 13)
        imm_u = ins & 0xfffff000
        imm_j = sext((((ins >> 31) & 1) << 20) | (((ins >> 12) & 0xff) << 12) |
                     (((ins >> 20) & 1) << 11) | (((ins >> 21) & 0x3ff) << 1), 21)
        npc = (pc + 4) & M32
        wval = None

        if op == 0x33:                                   # OP
            sh = b & 31
            if f3 == 0:   wval = a - b if f7 == 0x20 else a + b
            elif f3 == 1: wval = a << sh
            elif f3 == 2: wval = int(sa < sb)
            elif f3 == 3: wval = int(a < b)
            elif f3 == 4: wval = a ^ b
            elif f3 == 5: wval = (sa >> sh) if f7 == 0x20 else (a >> sh)
            elif f3 == 6: wval = a | b
            else:         wval = a & b
        elif op == 0x13:                                 # OP-IMM
            iu = imm_i & M32
            sh = rs2
            if f3 == 0:   wval = a + imm_i
            elif f3 == 1: wval = a << sh
            elif f3 == 2: wval = int(sa < imm_i)
            elif f3 == 3: wval = int(a < iu)
            elif f3 == 4: wval = a ^ iu
            elif f3 == 5: wval = (sa >> sh) if f7 == 0x20 else (a >> sh)
            elif f3 == 6: wval = a | iu
            else:         wval = a & iu
        elif op == 0x03:                                 # LOAD
            addr = (a + imm_i) & M32
            if f3 == 0:   wval = sext(rd_mem(addr, 1), 8)
            elif f3 == 1: wval = sext(rd_mem(addr, 2), 16)
            elif f3 == 2: wval = rd_mem(addr, 4)
            elif f3 == 4: wval = rd_mem(addr, 1)
            elif f3 == 5: wval = rd_mem(addr, 2)
        elif op == 0x23:                                 # STORE
            addr = (a + imm_s) & M32
            wr_mem(addr, {0: 1, 1: 2, 2: 4}[f3], b)
        elif op == 0x63:                                 # BRANCH
            take = {0: a == b, 1: a != b, 4: sa < sb, 5: sa >= sb,
                    6: a < b, 7: a >= b}.get(f3, False)
            if take:
                npc = (pc + imm_b) & M32
        elif op == 0x37:                                 # LUI
            wval = imm_u
        elif op == 0x17:                                 # AUIPC
            wval = pc + imm_u
        elif op == 0x6f:                                 # JAL
            wval = pc + 4
            npc = (pc + imm_j) & M32
        elif op == 0x67:                                 # JALR
            wval = pc + 4
            npc = (a + imm_i) & M32 & ~1
        # FENCE / SYSTEM / unknown -> NOP

        if wval is not None and rd != 0:
            regs[rd] = wval & M32
        pc = npc
    raise SystemExit('rvsim: step limit reached (program does not terminate in `j .`)')


def main():
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    inp = sys.argv[1]
    out = sys.argv[sys.argv.index('-o') + 1] if '-o' in sys.argv else inp.rsplit('.', 1)[0] + '.exp'
    maxs = int(sys.argv[sys.argv.index('--max-steps') + 1]) if '--max-steps' in sys.argv else 200000
    words = [int(l, 16) for l in open(inp) if l.strip()]
    regs, steps = run(words, maxs)
    with open(out, 'w') as f:
        for r in regs:
            f.write(f'{r:08x}\n')
    print(f'{inp}: {steps} instructions executed -> {out}')


if __name__ == '__main__':
    main()
