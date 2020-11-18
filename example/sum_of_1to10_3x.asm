	.data			
str:				
	.asciiz	"The count of 0 .. 10's 3x is "

	.text                  
  	.globl  main            
main:
	add		$t0, $t0, $zero		
    add		$t1, $t1, $zero	

loop:
	addi	$t0, $t0, 3
	add		$t1, $t1, $t0
	addi	$t3, $t3, 1

	slti	$t2, $t0, 10	
	bne		$t2, $zero, loop

	la		$a0, str	
    li		$v0, 4		
    syscall
       
	addi	$t3, $t3, -1	

	move	$a0, $t3	
    li		$v0, 1		
    syscall

	li		$v0, 10
	syscall