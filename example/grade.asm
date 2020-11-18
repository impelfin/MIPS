	.data	
msg1:	.asciiz	"\n Input Number(0: Exit) : "
msg2:	.asciiz	"\n Program Exit!! "
gda:	.asciiz	" Grades : A \n"
gdb:	.asciiz	" Grades : B \n"
gdc:	.asciiz	" Grades : C \n"
gdd:	.asciiz	" Grades : D \n"
gdf:	.asciiz	" Grades : F \n"
	
	.text
	.globl	main
main:
	li		$t0, 0
	li		$t1, 10

	li		$v0, 4
	la		$a0, msg1
	syscall

	li		$v0, 5
	syscall
	move	$t0, $v0

	beq		$t0, 0, exit

	div		$t0, $t1
	mflo	$t2

	bne		$t2, 10, g9		
	la		$a0, gda
	b		gp

g9:	bne		$t2, 9, g8
	la		$a0, gda
	b		gp

g8:	bne		$t2, 8, g7
	la		$a0, gdb
	b		gp

g7:	bne		$t2, 7, g6
	la		$a0, gdc
	b		gp

g6:	bne		$t2, 6, gx
	la		$a0, gdd
	b		gp

gx:	la		$a0, gdf
	b		gp

gp:	li		$v0, 4
	syscall
	j		main

exit:
	li		$v0, 4
	la		$a0, msg2
	syscall

	li	$v0, 10
	syscall