	.file	"add_extra.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	registers
	.bss
	.align	2
	.type	registers, @object
	.size	registers, 12
registers:
	.zero	12
	.text
	.align	2
	.globl	ADD
	.type	ADD, @function
ADD:
	# please start your code
	lui a3,%hi(registers)
 	addi a3,a3,%lo(registers)
 	slli a0,a0,2
 	slli a1,a1,2
 	slli a2,a2,2
 	add a0,a3,a0
 	add a1,a3,a1
 	add a2,a3,a2
    lw t0,0(a0)
    lw t1,0(a1)
    add t2,t0,t1
	sw t2,0(a2)
    xor t3,t0,t1
    srai t3,t3,31
	not t3,t3
	xor t4,t0,t2
	srai t4,t4,31
	and a0,t3,t4
	snez a0,a0
    jr ra
	.size	ADD, .-ADD
	.section	.rodata
	.align	2
.LC0:
	.string	"Test 1 Overflow: ADD"
	.align	2
.LC1:
	.string	"Pass"
	.align	2
.LC2:
	.string	"Fail"
	.align	2
.LC3:
	.string	"Test 2 Overflow: ADD"
	.align	2
.LC4:
	.string	"Test 3 Overflow: ADD"
	.align	2
.LC5:
	.string	"End of test"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2147483648
	xori	a4,a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,4(a5)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	ADD
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L7
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2147483648
	bne	a4,a5,.L7
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L8
.L7:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L8:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2147483648
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,4(a5)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	ADD
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L9
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2147483648
	xori	a5,a5,-1
	bne	a4,a5,.L9
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L10
.L9:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L10:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2147483648
	addi	a4,a4,1
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-2
	sw	a4,4(a5)
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	li	a2,2
	li	a1,1
	li	a0,0
	call	ADD
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L11
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-2147483648
	xori	a5,a5,-1
	bne	a4,a5,.L11
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L12
.L11:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L12:
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	puts
	li	a5,0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 10.1.0-2020.08.2) 10.1.0"
