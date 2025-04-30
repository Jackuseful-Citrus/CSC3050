	.file	"sll.c"
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
	.globl	SLL
	.type	SLL, @function
SLL:
	# please start your code
	lui a3,%hi(registers)
 	addi a3,a3,%lo(registers)
 	slli a0,a0,2
 	slli a1,a1,2
	slli a2,a2,2
 	add a0, a3, a0
 	add a1, a3, a1
	add a2, a3, a2
 	lw t0,0(a0)
 	lw t1,0(a1)
	li t1, 2
	sll t1,t0,t1
	sw t1,0(a2)
	li a0, 0
 	jr ra
	.size	SLL, .-SLL
	.section	.rodata
	.align	2
.LC_debug:
	.string "SLL: val=%d, shift=%d\n"
	.align  2
.LC0:
	.string	"Test 1: SLL"
	.align	2
.LC1:
	.string	"Pass"
	.align	2
.LC2:
	.string	"Fail"
	.align	2
.LC3:
	.string	"Test 2: SLL"
	.align	2
.LC4:
	.string	"Test 3: SLL"
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
	li	a4,1
	sw	a4,0(a5)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SLL
	mv	a5,a0
	bne	a5,zero,.L4
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,4
	bne	a4,a5,.L4
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L5
.L4:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L5:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-1
	sw	a4,0(a5)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SLL
	mv	a5,a0
	bne	a5,zero,.L6
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-4
	bne	a4,a5,.L6
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L7
.L6:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L7:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	sw	zero,0(a5)
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SLL
	mv	a5,a0
	bne	a5,zero,.L8
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a5,8(a5)
	bne	a5,zero,.L8
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L9
.L8:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L9:
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
