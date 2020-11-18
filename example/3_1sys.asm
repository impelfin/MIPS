#
#  Code for Homework Problem 3.1 with system calls added
#

	.data			# Tell it to put the following in 
				# the "data" segment
prompt:	.asciiz "Enter number : "
ansis:	.asciiz "Answer is : "
nl:	.asciiz "\n"

	.text			# Tell it to put the following in 
				# the "text" segment

	.globl	main		# So the SPIM startup knows where our
				# program starts

main:	li	$v0, 4 		#set up for prompt
	la	$a0, prompt
	syscall

	li	$v0, 5 		#get int
	syscall

	move	$a0, $v0	# set up for computation

############################################################
###################    HW3.1 code    #######################
############################################################
begin:	addi	$t0, $zero, 0
	addi	$t1, $zero, 1

loop:	slt	$t2, $a0, $t1	
	bne	$t2, $zero, finish
	add	$t0, $t0, $t1
	addi	$t1, $t1, 2
	j	loop

finish:	add	$v0, $t0, $zero
############################################################

	move	$t5, $v0	#save answer

	li	$v0, 4		#print some newlines
	la	$a0, nl
	syscall

	li	$v0, 4		# print string
	la	$a0, ansis
	syscall

	li	$v0, 1		# print answer
	move	$a0, $t5
	syscall

	li	$v0, 4		# print a newline
	la	$a0, nl
	syscall

	jr	$ra		#return home