	.data          
in1:	.asciiz	"How many random number (Exit=0) : "
in2:	.asciiz	"How much max number : "
nl:	.asciiz "\n"
	.text
main:
	li	$v0, 4
	la	$a0, in1
	syscall	
	
	li	$v0, 5
	syscall
	move 	$s0, $v0
	
	beqz	$s0, Exit
	
	li	$v0, 4
	la	$a0, in2
	syscall	
	
	li	$v0, 5
	syscall
	move 	$s1, $v0	
	
	
	li	$t0, 211        # Seed values
	li	$t1, 3021377 
clear:
	li	$v1, 0		# Clear the flag
ranloop:
	mult    $t0, $t1
	mflo    $t0
	addiu   $t0, $t0, 5923

	move	$v1, $s1       # Controls Range (0 ? 99)
	divu    $t0, $v1
	mfhi    $a0		# Get Remainder
	li	$v0, 1      
	syscall  
	       
	li	$v0, 4		# Print newline
	la	$a0, nl 
	syscall 
   
	subi	$s0, $s0, 1
	beqz	$s0, Exit
	
	b	clear
Exit:
	li	$v0, 10
	syscall