# program calculates factorial 10! and prints the result
# it uses recursive procedure fact called from main
# illustrates the use of procedure call frames
# to store values needed for procedure
# C program
# main ()
# {
#   printf("The factorial of 10 is %d\n",fact(10));
# }
# 
# int fact(int n)
# {
#   if (n<1)
#      return(1);
#   else
#      return(n*fact(n-1));
# }

	.text			# put code into text segment
	.globl	main		# declare label main global to be accessible from other files
main:
	subu	$sp,$sp, 32	# stack frame is 32 bytes long, min length 24
				# here we use it to store only $fp, $ra, and $a0
	sw	$fp, 16($sp)	# save old frame pointer, after $a0-$a3
	sw	$ra, 20($sp)	# save return address in $ra 
	addu	$fp, $sp, 28	# set up frame pointer to the 1st word in frame

	li	$a0, 10		# put argument (10) for factorial
	jal	fact		# call factorial function

        move     $s0,$v0	# store result from $v0 to avoid destruction
	la       $a0,$LC	# put string address in $a0
        li       $v0,4		# system call code for print_str
        syscall
       
	move     $a0,$s0	# pseudoinstr: move result to $a1
        li       $v0,1		# system call code for print_int
        syscall
	
	lw       $ra,20($sp)	# restore return address
	lw       $fp,16($sp)	# restore frame pointer
	addu     $sp,$sp,32	# pop stack frame - clean frame
        jr       $ra		# end of program, return to system

	.data			# put this to data segment
$LC:				#  string for printing
	.asciiz   "The factorial of 10 is \n"

	.text			# again text segment
fact:				# keeps code for factorial
        subu     $sp, $sp, 32	# same thing with frame preparation
	sw       $ra, 20($sp)
	sw       $fp, 16($sp)
	addu     $fp, $sp, 28
	sw       $a0, 0($fp)	# save factorial argument (n)

	lw       $v0, 0($fp)	# load n - kept in $a0 saved on stack
	bgtz     $v0, $L2	# branch if n>0
	li       $v0, 1		# return 1 (0!=1)
	j        $L1		# jump to code to return

$L2:
	lw       $v1, 0($fp)	# load n
	subu     $v0, $v1, 1	# compute  n-1
	move     $a0, $v0	# move value to $a0
	jal      fact		# call recursively factorial function
      
	lw       $v1, 0($fp)	# load n, here in fact proper computation of factorial
	mul      $v0, $v0, $v1	# computer fact(n-1) * n, note that $v0 is preserved
				# it multiplies successive values from $a0 stored in frames

$L1:				# result is in $v0
	lw       $ra, 20($sp)	# restore $ra
	lw       $fp, 16($sp)	# restore $fp	
	addu     $sp, $sp,32	# pop stack
	j        $ra		# return to caller	