#include <stdio.h>
#main()
#{
#	int i=3,j=7;
#	printf("Big Number is %d \n", i > j ? i : j); 
#}

	.data		# put this to data segment
				# string for printing
str:  	.asciiz	" Big number is "

	.text			# begin of code
	.globl  main	# main is global and can be accessed from other files
main:
	li		$t0, 3
	li		$t1, 7

	li		$v0, 4		# system call code for print_str SPIM I/O call
	la		$a0, str	# address of string to print in $a0
	syscall
	
	blt	 	$t0, $t1, L1 # slt $t2, $t0, $t1
                         # bne $t2, $zero, L1  = bnez $t2, L1
	li		$v0, 1			# system call code for print_int
	move	$a0, $t0	# pseudoinstr: move result to $a0
	syscall

	j		Exit

L1: 	
	li		$v0, 1			# system call code for print_int
	move	$a0, $t1	# pseudoinstr: move result to $a0
	syscall

Exit:	
	li		$v0, 10
	syscall			# exit
