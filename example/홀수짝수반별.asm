	.data	
msg1:	.asciiz	"Input Number(0: Exit) : "
msg2:	.asciiz	"The number you entered is "
msg3:	.asciiz	"even number.\n"
msg4:	.asciiz	"odd number.\n"
msg5:	.asciiz	"Program Exit!!\n"

	.text
	.globl	main
main:
	addi	$t0, $t0, 2
loop:
	li	$t1,0

	li	$v0, 4
	la	$a0, msg1
	syscall

	li	$v0, 5
	syscall
	add	$t1, $t1, $v0

	beq	$t1, $zero, exit

	li	$v0, 4
	la	$a0, msg2
	syscall
	
	div	$t1, $t0
	mfhi	$t2

	beq	$t2, $zero, even

	li	$v0, 4
	la	$a0, msg4
	syscall

	j	loop
even:
	li	$v0, 4
	la	$a0, msg3
	syscall

	j	loop
exit:
	li	$v0, 4
	la	$a0, msg5
	syscall

	li	$v0, 10
	syscall