	.data
	# prompt to read
num1:		.float 0.0	
read:		.asciiz "Enter a float (0 quits loop): "
print:  	.asciiz "The number is: "
newline: 	.asciiz "\n"
goodbye:	.asciiz "Goodbye\n"
	.globl	main
	.text
main:	
loop:	li $v0, 4	# system call code for printing string = 4
	la $a0, read	# load address of string to be printed into $a0
	syscall		# call operating system to perform print operation
	
	li $v0, 6	# get ready to read in float
	syscall		# system waits for input
	s.s $f0, num1	# store the result of the read (returned in $f0) in num1
	#mfc1 $f0, $t0

	li $v0, 4	# system call code for printing string = 4
	la $a0, print	# load address of string to be printed into $a0
	syscall		# call operating system to perform print operation
		
	li $v0, 2	# system call code for printing float = 2
	l.s $f12, num1
	syscall		# print float stored in $f12
	
	li $v0, 4	# system call code for printing string = 4
	la $a0, newline	# load address of string to be printed into $a0
	syscall		# call operating system to perform print operation
	
	lw	$t0, num1
	bnez $t0, loop

	li $v0, 4		# system call code for printing string = 4
	la $a0, goodbye		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation
	
	li $v0, 10		# exits program
	syscall
	