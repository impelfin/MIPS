	.data			
str:				
	.asciiz	"The sum from 0 .. 10 is "

	.text                  
  	.globl  main            
main:
	add		$t0, $t0, $zero		
	add		$t1, $t1, $zero		
loop:
	addi	$t0, $t0, 1
	add		$t1, $t1, $t0	
	slti	$t2, $t0, 10	# blt	$t0, 10, loop
	bne		$t2, $zero, loop

	la		$a0, str	
	li		$v0, 4		
	syscall
       
	move	$a0, $t1	
	li		$v0, 1		
	syscall

	li		$v0, 10
	syscall