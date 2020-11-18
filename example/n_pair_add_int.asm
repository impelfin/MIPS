# add n first pairs of two integer vectors A and B stored in data segment
# n read from console, the result store as vector C in data segment
# and print a message "The job is done"

	.data
A:      .word	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
B:      .word	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
C:      .space	80
msg:    .asciiz	"The job is done"

	.globl  main
	.text

main:   li	$v0, 5		# read n, result in $v0                         
        syscall

        la	$t0,  A		# in $t0 address of A
	la	$t1,  B		# in $t1 address of B
	la	$t2,  C		# in $t2 address of C

loop:   lw	$t3, 0($t0)
        lw	$t4, 0($t1)
        add	$t5, $t3, $t4
        sw	$t5, 0($t2)
        addi	$t0, $t0, 4 
        addi	$t1, $t1, 4
        addi	$t2, $t2, 4  
	addi	$v0, $v0, -1
	bnez	$v0, loop	# n pairs added?

	la	$a0, msg
	li	$v0, 4
	syscall			# print message

	li	$v0, 10
	syscall			# exit program
       