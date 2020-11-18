	.data	
msg1:	.asciiz	"\n Input Number(0: Exit) : "
msg2:	.asciiz	"\n Promgram Exit!! "
gda:	.asciiz	" Grades : A \n"
gdb:	.asciiz	" Grades : B \n"
gdc:	.asciiz	" Grades : C \n"
gdd:	.asciiz	" Grades : D \n"
gdf:	.asciiz	" Grades : F \n"
	
	.text
	.globl	main
main:
	li		$v0, 4
	la		$a0, msg1
	syscall

	li		$v0, 5
	syscall
	move	$t0, $v0

	beq		$t0, 0, exit

	blt		$t0, 90, g9		
	la		$a0, gda
	j		gp

g9:	blt		$t0, 80, g8
	la		$a0, gdb
	j		gp

g8:	blt		$t0, 70, g7
	la		$a0, gdc 
	j		gp

g7:	blt		$t0, 60, gx
	la		$a0, gdd
	j		gp

gx:	la		$a0, gdf

gp:	li		$v0, 4
	syscall
	j		main
exit:
	li		$v0, 4
	la		$a0, msg2
	syscall

	li		$v0, 10
	syscall