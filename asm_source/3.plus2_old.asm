#
	.data
str1: .asciiz " + "
str2: .asciiz " = "
save: .word	1,2

	.text
main:
	la		$s1, save

	li		$v0, 1
	lw		$a0, 0($s1)
	syscall

	li		$v0, 4
	la		$a0, str1
	syscall

	li		$v0, 1
	lw		$a0, 4($s1)
	syscall

	li		$v0, 4
	la		$a0, str2
	syscall

	move	$s2, $zero
	lw		$t0, 0($s1)
	lw		$t1, 4($s1)
	add		$s2, $t0, $t1

	li		$v0, 1
	move	$a0, $s2
	syscall

	li		$v0, 10
	syscall