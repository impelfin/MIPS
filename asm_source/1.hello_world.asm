# 
# print Hello World!!!
#
	.data
str: 	.asciiz 	"\nHello World!!!"

	.text
	.globl main
main:
	addi 	$t0, $zero, 2

	li 		$v0, 1
	move 	$a0, $t0
	syscall       	# print int

	li 		$v0, 4
	la 		$a0, str
	syscall       	# print string

	li 		$v0, 10
	syscall     	# exit