	.data
in1:	.asciiz	"input your name :  "
out1:	.asciiz "your name is "
name:	.space	200

	.text
	.globl	main
main:

	li		$v0, 4
	la		$a0, in1
	syscall

	li		$v0, 8
	la		$a0, name
	li		$a1, 200
	syscall

	li		$v0, 4
	la		$a0, out1
	syscall
	
	li		$v0, 4
	la		$a0, name
	syscall

	li		$v0, 10
	syscall