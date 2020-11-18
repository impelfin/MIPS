# add n first pairs of two floating point vectors A and B stored in data segment
# n read from console, the result store as vector C in data segment
# and print a message "The job is done"

	.data
A:      .float	0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.10,0.11,0.12,0.13,0.14,0.15,0.16,0.17,0.18,0.19,0.20
B:      .float	0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.10,0.11,0.12,0.13,0.14,0.15,0.16,0.17,0.18,0.19,0.20
C:      .space	80
msg:    .asciiz	"The job is done"

	.globl  main
	.text

main:   li	$v0,  5		# read n, result in $v0                         
        syscall

        la	$t0,  A		# in $t0 address of A
	la	$t1,  B		# in $t1 address of B
	la	$t2,  C		# in $t2 address of C

loop:   lwc1	$f3, 0($t0)	# floating-point load element of A 
        lwc1	$f4, 0($t1)	# load element of B
        div.s	$f5, $f3, $f4	# perform floating point operation
        swc1	$f5, 0($t2)	# store result to vector C
        addi	$t0, $t0, 4	# increment address
        addi	$t1, $t1, 4
        addi	$t2, $t2, 4  
	addi	$v0, $v0, -1
	bnez	$v0, loop	# n pairs divided?

	la	$a0, msg
	li	$v0, 4
	syscall			# print message

	li	$v0, 10
	syscall			# exit program       