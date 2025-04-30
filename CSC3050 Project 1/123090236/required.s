	.file	"required.c"
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
	.globl	NOT
	.type	NOT, @function
NOT:
	# please start your code
	lui a3,%hi(registers)
 	addi a3,a3,%lo(registers)
 	slli a0,a0,2
	slli a1,a1,2
 	add a0, a3, a0
	add a1, a3, a1
	lw a0,0(a0)
	not a0,a0
	sw a0,0(a1)
	li a0,0
	jr ra
	.size	NOT, .-NOT
	.align	2
	.globl	SUBI
	.type	SUBI, @function
SUBI:
	# please start your code
	lui a3,%hi(registers)
 	addi a3,a3,%lo(registers)
 	slli a0,a0,2
 	slli a2,a2,2
 	add a0, a3, a0
 	add a2, a3, a2
	lw t0,0(a0)
	sub t0,t0,a1
	sw t0,0(a2)
	li a0,0
	jr ra
	.size	SUBI, .-SUBI
	.align	2
	.globl	BG
	.type	BG, @function
BG:
	# please start your code
	lui a3,%hi(registers)
 	addi a3,a3,%lo(registers)
 	slli a0,a0,2
 	slli a1,a1,2	
	add a0, a3, a0
 	add a1, a3, a1
	lw t0,0(a0)
 	lw t1,0(a1)
	slt t2,t1,t0
	sw t2,8(a3)
	lw a0,8(a3)
	jr ra
	.size	BG, .-BG
	.section	.rodata
	.align	2
.LC0:
	.string	"Test 1: NOT"
	.align	2
.LC1:
	.string	"Pass"
	.align	2
.LC2:
	.string	"Fail"
	.align	2
.LC3:
	.string	"Test 2: NOT"
	.align	2
.LC4:
	.string	"Test 3: NOT"
	.align	2
.LC5:
	.string	"End of NOT test"
	.align	2
.LC6:
	.string	"Test 1: SUBI"
	.align	2
.LC7:
	.string	"Test 2: SUBI"
	.align	2
.LC8:
	.string	"Test 3: SUBI"
	.align	2
.LC9:
	.string	"End of SUBI test"
	.align	2
.LC10:
	.string	"Test 1: BG"
	.align	2
.LC11:
	.string	"Test 2: BG"
	.align	2
.LC12:
	.string	"Test 3: BG"
	.align	2
.LC13:
	.string	"End of BG test"
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
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	li	a1,2
	li	a0,0
	call	NOT
	mv	a5,a0
	bne	a5,zero,.L8
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-6
	bne	a4,a5,.L8
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L9
.L8:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L9:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,3
	sw	a4,0(a5)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	li	a1,2
	li	a0,0
	call	NOT
	mv	a5,a0
	bne	a5,zero,.L10
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-4
	bne	a4,a5,.L10
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L11
.L10:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L11:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,6
	sw	a4,0(a5)
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	li	a1,2
	li	a0,0
	call	NOT
	mv	a5,a0
	bne	a5,zero,.L12
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-7
	bne	a4,a5,.L12
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L13
.L12:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L13:
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	puts
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,1
	sw	a4,0(a5)
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	puts
	li	a2,2
	li	a1,2
	li	a0,0
	call	SUBI
	mv	a5,a0
	bne	a5,zero,.L14
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-1
	bne	a4,a5,.L14
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L15
.L14:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L15:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,10
	sw	a4,0(a5)
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	puts
	li	a2,2
	li	a1,-2
	li	a0,0
	call	SUBI
	mv	a5,a0
	bne	a5,zero,.L16
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,12
	bne	a4,a5,.L16
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L17
.L16:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L17:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,-22
	sw	a4,0(a5)
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	puts
	li	a2,2
	li	a1,4
	li	a0,0
	call	SUBI
	mv	a5,a0
	bne	a5,zero,.L18
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	lw	a4,8(a5)
	li	a5,-26
	bne	a4,a5,.L18
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L19
.L18:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L19:
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	puts
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	puts
	li	a1,1
	li	a0,0
	call	BG
	mv	a5,a0
	bne	a5,zero,.L20
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L21
.L20:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L21:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,4
	sw	a4,4(a5)
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	puts
	li	a1,1
	li	a0,0
	call	BG
	mv	a4,a0
	li	a5,1
	bne	a4,a5,.L22
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L23
.L22:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L23:
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,4
	sw	a4,0(a5)
	lui	a5,%hi(registers)
	addi	a5,a5,%lo(registers)
	li	a4,5
	sw	a4,4(a5)
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	puts
	li	a1,1
	li	a0,0
	call	BG
	mv	a5,a0
	bne	a5,zero,.L24
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	j	.L25
.L24:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	puts
.L25:
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	puts
	li	a5,0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 10.1.0-2020.08.2) 10.1.0"
