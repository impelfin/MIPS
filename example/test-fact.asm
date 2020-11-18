
	 .data               
str1:    .asciiz "input n (수를 넣고 Enter치시오) = "
str2:	 .asciiz "! ===== "
str3:    .asciiz "This is for the procedure length."
newline: .asciiz "\n"

	.text
main:	
	li	$v0, 4		# load immed.  (pseudo)
	la	$a0, str1	# load address (pseudo)
	syscall

	li	$v0, 5
	syscall
	move	$a0, $v0	# move (pseudo)

	addi	$sp, $sp, -4
	sw	$ra, 0($sp)

	jal	fact
	add	$s0, $zero, $v0
	j	Exit

fact:	
	slti	$t0, $a0, 1
	beq	$t0, $zero, L1
	addi	$v0, $zero, 1
	jr	$ra

L1:	addi	$sp, $sp, -8
	sw	$ra, 4($sp)
	sw	$a0, 0($sp)
	
	addi	$a0, $a0, -1
	jal	fact
	
	lw	$a0, 0($sp)
	lw	$ra, 4($sp)
	addi	$sp, $sp, 8

	mul	$v0, $a0, $v0	# multiply (pseudo)
	jr	$ra

len:    

Exit:	
	addi	$v0, $zero, 1
	add	$a0, $a0, $zero
	syscall

	addi	$v0, $zero, 4
	la	$a0, str2    
	syscall

	addi	$v0, $zero, 1
	add	$a0, $s0, $zero
	syscall

	addi	$v0, $zero, 4
	la	$a0, newline    
	syscall

	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra