	.data
nl:		.asciiz "\n"
save: 	.word	1,2

	.text
main:
	la		$s1, save

	lw		$t0, 0($s1)
	lw		$t1, 4($s1)

	li		$v0, 1
	move	$a0, $t0
	syscall

	li		$v0, 4
	la		$a0, nl
	syscall

	li		$v0, 1
	move	$a0, $t1
	syscall

	li		$v0, 10
	syscall