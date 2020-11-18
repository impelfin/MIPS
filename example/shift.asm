# testing shift

	.data                   # put this to data segment
prompt:	.asciiz " Enter number : "
msg1:	.asciiz	" befor shift left 2 number : "
msg2:	.asciiz	" after shift left 2 number : "
endl:   .asciiz " \n"

	.text			# put code into text segment
	.globl	main		# declare label main global to be accessible from other files

main:				# begin of assembly program consisting only of text segment
	la		$a0, prompt
	li		$v0, 4
	syscall

	li		$v0, 5		# read_int
	syscall

	move	$s0, $v0	# pseudoinstruction: move immediate to dest

	sll     $s1, $s0, 2

	la		$a0, msg1
	li		$v0, 4
	syscall

	move	$a0, $s0	# pseudoinstr: move result to $a0
	li		$v0, 1		# system call code for print_int
	syscall

	la		$a0, endl
	li		$v0, 4
	syscall

	la		$a0, msg2
	li		$v0, 4
	syscall

	move	$a0, $s1	# pseudoinstr: move result to $a0
	li		$v0, 1		# system call code for print_int
	syscall

	la		$a0, endl
	li		$v0, 4
	syscall

	li      $v0, 10		# exit program system code in $v0
	syscall			# exit program