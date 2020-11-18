# #include<stdio.h>
# 
# void main()
# {
# 	int i=0, n=1, sum=0;
# 	
# 	while( n > 0 )
# 	{
# 		i += 1;
# 		printf("%d Please enter your score(negative : Exit) : ", i);
# 		scanf("%d", &n);
# 		sum += n;
# 	}
# 	i -= 1;
# 	sum -= n;
# 	printf("%d Total Score : %d \n", i, sum);
# }
	.data                   
msg1:	.asciiz	" Please enter your score(negative : Exit) : "
msg2:	.asciiz	" Total Score : "

	.text			
	.globl  main		

main:	
	li      $s0, 0		
loop:	
	addi	$s0, $s0, 1

	move	$a0, $s0
	li		$v0, 1
	syscall

	la		$a0, msg1
	li		$v0, 4
	syscall

	li      $v0, 5		
	syscall                 

	add     $s1, $s1, $v0   
	bge     $v0, $zero, loop
	
	addi	$s0, $s0, -1
	sub		$s1, $s1, $v0

	move	$a0, $s0
	li      $v0, 1		
	syscall	

	la		$a0, msg2
	li		$v0, 4
	syscall

	move	$a0, $s1
	li      $v0, 1		
	syscall			

	li      $v0, 10		
	syscall			