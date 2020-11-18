
	.data

pi :	.double 3.1416
sqrt:	.float 1.41

str1:	.asciiz "The integer value is = "
str2:	.asciiz "The float value is = "
str3:	.asciiz "The double value is = "
endl:	.asciiz "\n"

	.text
	.globl main

main:	li	$v0,4	#system call code for print_str
	la	$a0,str1#load address of str1 in a0
	syscall		#print the string

	li	$v0,1	#system call code for print_int
	li	$a0,4	#load the desired integer value in a0
	syscall		#print the integer

	li	$v0,4	#print a new line
	la	$a0,endl
	syscall

	li	$v0,4	#system call code for print_str
	la	$a0,str2#load address of str2 in a0
	syscall		#print the string

	li $v0,2	#system call code for print_float
	la $a0,sqrt	#load address of sqrt in a0
	l.d $f12,0($a0)	#load the desired float value in f12
	syscall		#print the float value

	li $v0,4	#print a new line
	la $a0,endl        
	syscall             

	li $v0,4	#system call code for print_str
	la $a0,str3	#load address of str3 in a0
	syscall		#print the string

	li $v0,3	#system call code for print_double
	la $a0,pi
	l.d $f12,0($a0)	#load the desired double value in f12
	syscall		#print the double

	li $v0,4	#print a new line
	la $a0,endl
	syscall 

	li $v0,10	#system call code for exit
	syscall 