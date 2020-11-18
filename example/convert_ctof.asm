	.data
in:	.asciiz	"\n Input C Temperature : "
out:	.asciiz	"\n F Temperature  : "
fp18:	.float	1.8
fp32:	.float	32.0
fpnum:	.float	0.0
		.globl main
		.text
main:	
	l.s	$f2, fp18
	l.s	$f4, fp32

	li	$v0, 4
	la	$a0, in
	syscall

	li	$v0, 6
	syscall
	
	mul.s	$f6, $f2, $f0
	add.s	$f8, $f4, $f6
	s.s	$f8, fpnum	

	li	$v0, 2
	l.s	$f12, fpnum
	syscall

exit:
	li	$v0, 10
	syscall