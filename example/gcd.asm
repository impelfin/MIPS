# #include<stdio.h>
# 
# void main()
# {
# 	int x, y;
# 	printf(" Input number 1 : ");
# 	scanf("%d", &x);
# 	printf(" Input number 2 : ");
# 	scanf("%d", &y);
# 	
# 	printf(" GCD of numbers %d and %d is equal ", x, y);
# 
# 	while( x != y )
# 	{
# 		if( x > y )
# 			x = x - y;
# 		else
# 			y = y - x;
# 	}
# 	printf("GCD is %d \n", x);
# }
	.data
msg1:	.asciiz	" Input number 1 : "
msg2:	.asciiz	" Input number 2 : "
msg3:	.asciiz	" GCD of numbers "
msg4:	.asciiz	" and "
msg5:	.asciiz	" is equal "

	.globl	main
	.text

main:  
	la	$a0, msg1
	li	$v0, 4
	syscall

	li	$v0, 5		# read A, result in $v0                         
        syscall
        move	$t1, $v0	# A in $t1

	la	$a0, msg2
	li	$v0, 4
	syscall

        li	$v0, 5		# read B, result in $v0                         
        syscall
        move	$t2, $v0	# B in $t2

	la	$a0, msg3
	li	$v0, 4
	syscall                 # print "GCD of numbers "

        li	$v0,1
        move	$a0,$t1
        syscall                 # print A

	la	$a0, msg4
	li	$v0, 4
	syscall			# print " and "

        li	$v0,1
        move	$a0,$t2
        syscall			# print B

	la	$a0, msg5
	li	$v0, 4
	syscall			# print " is equal "

loop:   beq	$t1,$t2,printC	# GCD will be $t1 and goto printing GCD
        blt	$t1,$t2,lab1	# we use Euclid algorithm
        sub	$t1,$t1,$t2
        j	loop

lab1:   sub	$t2,$t2,$t1
        j	loop

printC: li	$v0,1		# print GCD
        move	$a0,$t1
        syscall
	
	li	$v0, 10
	syscall			# exit program       