	.data
str:    .asciiz "Enter an integer value "
msg:	.asciiz "The value is "

	.text
	.globl	main

main:	li	$v0, 4		#system call code for print_str
	la	$a0, str	#load address of str1 in a0
	syscall			#print the string

	li	$v0, 5		#system call code for read_int
	syscall			#the value is return in V0
	move	$t0, $v0	#save the value that has been read

	li	$v0, 4		#system call code for print_str
	la	$a0, msg	#load address of str1 in a0
	syscall			#print the string

	li	$v0, 1		#system call code for print_int
	move	$a0, $t0	#put the integer value in a0
	syscall			#print the integer

	li	$v0, 10		#system call code for exit
	syscall