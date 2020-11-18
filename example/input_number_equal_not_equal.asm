	.data
msg1:	.asciiz	"first input num:  "
msg2:	.asciiz	"second input num: "
str1:	.asciiz	"Two number is equal"
str2:	.asciiz	"Two number is not equal"
#num: .word	

	.globl	main
	.text
main:
	la	$a0, msg1
	li	$v0, 4
	syscall

	li	$v0, 5
	syscall
	move $t0, $v0

	la	$a0, msg2
	li	$v0, 4
	syscall

	li	$v0, 5
	syscall
	move $t1, $v0

	bne	$t0, $t1, L1
	la	$a0, str1
	j	print
L1:
	la	$a0, str2
print:
	li	$v0, 4
	syscall
exit:
	li	$v0, 10
	syscall