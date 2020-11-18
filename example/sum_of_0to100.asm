# C program
# #include <stdio.h>
# main()
# {
#   int i;
#   int sum=0;
#   for (i=0; i<=100; i=i+1) sum=sum + i*i;
#   printf("The sum from 0 .. 100 is %d\n",sum);
# }

# MIPS assembly program with text and data segment and SPIM i/o

	.data			# put this to data segment
str:.asciiz	"The sum from 0 .. 100 is \n" # string for printing

	.text                   # begin of code
#	.align	2               # align on word boundary
	.globl  main            # main is global and can be accessed from other files

main:
	li		$t0, 0		# clear $t0 - i=0
    li		$t2, 0		# clear sum
loop:
	mult	$t0, $t0	# i * i
	mflo 	$t1
    addu	$t2, $t2, $t1	# calculate new sum
    addi	$t0, $t0, 1	# i = i + 1
    ble		$t0, 100, loop	# if i<=100 return to loop

	la		$a0, str	# address of string to print in $a0
    li		$v0, 4		# system call code for print_str SPIM i/o call
    syscall
       
	move	$a0, $t2	# pseudoinstr: move result to $a0
   	li		$v0, 1		# system call code for print_int
	syscall
	
	jr	$ra		# end of program, return to system	
