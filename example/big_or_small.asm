
	.data					# put this to data segment
value:	.word	4, 8		# data for addition
msg1:	.asciiz	" is "
msg2:	.asciiz	" less "
msg3:	.asciiz	" greater "
msg4:	.asciiz	" than "

	.text				# begin of code
	.globl  main		# main is global and can be accessed from other files

main:		
	la		$t0, value	# load address 'value' into $t0	
	lw   	$t1, 0($t0)	# load word 0(value) into $t1
	lw   	$t2, 4($t0)	# load word 4(value) into $t2

	li		$v0, 1		# system call code for print_int
	move	$a0, $t1	# pseudoinstr: move result to $a0
	syscall
	
	li		$v0, 4		# system call code for print_str SPIM I/O call
	la		$a0, msg1	# address of string to print in $a0
	syscall
       
	slt		$t3, $t1, $t2	# If reg $t1 <= $t2 then go to Lable
	beq		$t3, $zero, Lable

	li		$v0, 4		# system call code for print_str SPIM I/O call
	la		$a0, msg2	# address of string to print in $a0
	syscall

	j 		Exit

Lable:		
	li		$v0, 4		# system call code for print_str SPIM I/O call
	la		$a0, msg3	# address of string to print in $a0
	syscall 

Exit:
	li		$v0, 4		# system call code for print_str SPIM I/O call
	la		$a0, msg4	# address of string to print in $a0
	syscall
	
	li		$v0, 1		# system call code for print_int
	move	$a0, $t2	# pseudoinstr: move result to $a0
	syscall

	li		$v0, 10
	syscall			# exit
