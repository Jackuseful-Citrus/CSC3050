.globl _start

_start:
    li a1, 1
    li a2, 2
    li a3, 0
    mul a6, a2, a1
    li x5, 4 
    li x8, 0 
    sw a6, 0x12(zero)
    li a6, 2048
    li x6, 1 
    li a4, 16 
    sw a6, 0x36(zero)
    li a6, 10
    li x7, 1 
    sw a6, 0x20(zero)
loop:
    mul a4, a1, a2         # t1 = a1 * a2 
    lw a5, 0x20(zero)      # load a5 ← loop var
    lw t0, 0x12(zero)      # 提前加载地址0x12（避免之后load-use）
    add a3, a3, a4         # a3 += t1
    addi x8, x6, 0         # x8 = x6
    add x6, x7, x6         # x6 = x6 + x7
    addi a5, a5, 1
    addi a1, a1, 1
    add x7, zero, x6       # x7 = x6
    sw a5, 0x20(zero)
    addi a5, a5, 1
    mul a6, x8, a3         # t2 = fib * a3
    addi a2, a2, 1
    sw a5, 0x12(zero)
    add a6, a6, a3         # a6 = t2 + a3
f3:
    lw x8, 0x36(zero)
    andi x1, x8, 1
    beq x1, zero, f2
f1:
    addi x8, x8, -1
    j end_condition
f2:
    srli x8, x8, 1
end_condition:
    sw x8, 0x36(zero)
    bnez x8, loop
    li a7, 93
    ecall
