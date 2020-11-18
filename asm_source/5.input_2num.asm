	.data
in1:	.asciiz	"first input num : "
in2:	.asciiz	"second input num : "
out1:	.asciiz "first input num is "
out2:	.asciiz "second input num is "	
end:	.asciiz "\n"

	.text
	.globl	main
main:
	la		$a0, in1
	li		$v0, 4
	syscall

	li		$v0, 5
	syscall
	move 	$t0, $v0

	li		$v0, 4
	la		$a0, in2
	syscall

	li		$v0, 5
	syscall
	move 	$t1, $v0

	li		$v0, 4
	la		$a0, out1
	syscall
	
	li		$v0, 1
	move	$a0, $t0
	syscall

	li		$v0, 4
	la		$a0, end
	syscall

	li		$v0, 4
	la		$a0, out2
	syscall
	
	li		$v0, 1
	move	$a0, $t1
	syscall

	li		$v0, 10
	syscall