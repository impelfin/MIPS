	.data
in:	.asciiz	"\n Input 3 digit number(0:Exit) : "
out:	.asciiz	"\n Output : "
	.globl main
	.text
main:	
	li	$t0, 10
	li	$t1, 100

loop:
	li	$v0, 4
	la	$a0, in
	syscall

	li	$v0, 5
	syscall
	move	$s0, $v0
	beq	$s0, $zero, exit

	div	$s0, $t1
	mflo	$s1		# first Number

	div	$s0, $t0
	mfhi	$s3		# Third Number
	mflo	$t2

	div	$t2, $t0	# second Number
	mfhi	$s2

	li	$v0, 1
	move	$a0, $s3
	syscall

	li	$v0, 1
	move	$a0, $s2
	syscall

	li	$v0, 1
	move	$a0, $s1
	syscall

	j	loop
exit:
	li	$v0, 10
	syscall