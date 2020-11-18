# 
# print  ¡°Hello World!!!¡±
#
	.data
str:	.asciiz	"Hello World!!!"

	.text
	.globl main
main:
	li	$v0, 4
	la	$a0, str
	syscall       	# print string

	li    $v0, 10
	syscall     	# exit