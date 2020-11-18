#include <stdio.h>
#main()
#{
#	int i=3,j=7;
#	if(i == j){ 
#		printf(" Two number is equal \n"); 
#	} else {
#		printf(" Two number is not equal \n");
#	}
#}
# MIPS assembly program with text and data segment and SPIM i/o

	.data		# put this to data segment
				# string for printing
str1:  	.asciiz   " Two number is equal "
str2:  	.asciiz   " Two number is not equal "

	.text			# begin of code
	.globl	main	# main is global and can be accessed from other files
main:
	li	$t0, 3
	li	$t1, 7
	
	bne	$t0, $t1, L1
	li	$v0, 4		# system call code for print_str SPIM I/O call
	la	$a0, str1	# address of string to print in $a0
	syscall 

	j Exit
L1:    
	li	$v0, 4		# system call code for print_str SPIM I/O call
	la	$a0, str2	# address of string to print in $a0
	syscall 

Exit:
	li	$v0, 10
	syscall			# exit
