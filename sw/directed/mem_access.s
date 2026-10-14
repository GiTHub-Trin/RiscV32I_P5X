# mem_access.s - byte / halfword / word loads and stores, sign/zero extension
    li    x1, 0x8899aabb
    sw    x1, 0(x0)
    lb    x2, 0(x0)           # 0xFFFFFFBB
    lb    x3, 1(x0)           # 0xFFFFFFAA
    lbu   x4, 2(x0)           # 0x99
    lbu   x5, 3(x0)           # 0x88
    lh    x6, 0(x0)           # 0xFFFFAABB
    lhu   x7, 2(x0)           # 0x8899
    lh    x8, 2(x0)           # 0xFFFF8899
    li    x9, 0x11
    sb    x9, 1(x0)
    lw    x10, 0(x0)          # 0x889911bb
    li    x11, 0x2233
    sh    x11, 2(x0)
    lw    x12, 0(x0)          # 0x223311bb
    sh    x11, 0(x0)
    lw    x13, 0(x0)          # 0x22332233
    sw    x1, 8(x0)
    lw    x14, 8(x0)
    sb    x9, 11(x0)
    lw    x15, 8(x0)          # store-to-load through memory, byte lane 3
    sb    x1, 4(x0)
    sb    x9, 5(x0)
    sb    x9, 6(x0)
    sb    x9, 7(x0)
    lw    x16, 4(x0)
    lw    x17, 4(x0)
    add   x18, x17, x16
done:
    j     done
