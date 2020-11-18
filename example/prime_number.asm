	.data
msg1:	.asciiz	"\n Input number(0:Exit) : "
msg2:	.asciiz	"\n Input number is Prime number. \n"
msg3:	.asciiz	"\n Input number is not Prime number. \n"
	.globl main
	.text
main:	li	$t0, 1
	li	$t1, 0

	li	$v0, 4
	la	$a0, msg1
	syscall

	li	$v0, 5
	syscall
	move	$s0, $v0
	
	beq	$s0, $zero, exit

loop:	addi	$t0, $t0, 1
	bgt	$t0, $s0, p1
	div	$s0, $t0
	mfhi	$s1

	bne	$s1, $zero, loop
	addi	$t1, $t1, 1
	j	loop

p1:	bne	$t1, 1, p2
	li	$v0, 4
	la	$a0, msg2
	syscall
	j	main
	
p2:	li	$v0, 4
	la	$a0, msg3
	syscall
	j	main

exit:	li	$v0, 10
	syscall