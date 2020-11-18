
	.text			# text section
	.globl main		# call main by SPIM

main:	
	la		$t0, value	# load address 'value' into $t0	
	lw   	$t1, 0($t0)	# load word 0(value) into $t1
	lw   	$t2, 4($t0)	# load word 4(value) into $t2
	lw		$t3, 8($t0)	# load word 8(value) into $t3

again:	
	beqz	$t2, End	
	add		$t1, $t1, 1	
	add		$t3, $t3, $t1	
	sub		$t2, $t2, 1	
	j		again

End:	
	sw   	$t3, 8($t0)	# store word $t3 into 8($t0)
		
	li 		$v0, 4
	la 		$a0, msg1
	syscall

	li		$v0, 1
	move	$a0, $t3
	syscall

	.data			# data section
value:	.word	0, 100, 0	# data for addition
msg1:	.asciiz	"SUM of 0~100 Number=>"
