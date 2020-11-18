	.data
name:
str1:	.asciiz "======== Input ========"
str2:	.asciiz "======== Output ========"
msg1:	.asciiz "name: "
msg2:	.asciiz "age: "
nl:	.asciiz "\n"
	.space 200

	.text
main:
	li	$v0, 4
	la	$a0, str1
	syscall

	li	$v0, 4
	la	$a0, nl
	syscall

	li	$v0, 4
	la	$a0, msg1
	syscall
	
	li      $v0, 8
	la      $a0, name
	li      $a1, 200
	syscall

	li	$v0, 4
	la	$a0, msg2
	syscall

	li	$v0, 5
	syscall
	move	$t1, $v0

	li	$v0, 4
	la	$a0, nl
	syscall

	li	$v0, 4
	la	$a0, str2
	syscall

	li	$v0, 4
	la	$a0, nl
	syscall

	li	$v0, 4
	la	$a0, msg1
	syscall
	
	li	$v0, 4
	la	$a0, name
	syscall
	
	li	$v0, 4
	la	$a0, msg2
	syscall
	
	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 4
	la	$a0, nl
	syscall

exit:
	li	$v0, 10
	syscall	