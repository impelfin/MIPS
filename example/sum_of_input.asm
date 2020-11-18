# program reads integers and adds them in the loop, 
# it stops when 0 is read, printing out the sum at that point

       	.data                   # put this to data segment
msg1:	.asciiz	" Input number (0 : Exit) : "
msg2:	.asciiz	"\n Sum of Input number : "

	.text			# begin of code
	.globl  main		# main is global and can be accessed from other files

main:				# begin of assembly program consisting only of text segment
	li      $a0, 0		# pseudoinstruction: move immediate to dest

loop:
	la		$a0, msg1
	li		$v0, 4
	syscall

	li      $v0, 5		# system call read integer code in $v0
	syscall                 # system call: feature of SPIM, not MIPS

	add     $t0, $t0, $v0   # in $v0 read integer
	bne     $v0, $zero, loop# if not 0 back to loop

	la		$a0, msg2
	li		$v0, 4
	syscall

	move	$a0, $t0
	li      $v0, 1		# print integer system code to $v0
	syscall			# proper printing

	li      $v0, 10		# exit program system code in $v0
	syscall			# exit program