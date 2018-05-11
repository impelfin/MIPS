        .data			
str:    .asciiz	"The sum from 0 .. 10 is "
        .text                   
        .globl  main            
main:
        li      $s1, 3		# increment
        li      $s2, 10		# Last number
        li      $t0, 0		# count
        li      $t1, 0		# sum
loop:
        addi    $t0, $t0, 1	
        add     $t1, $t1, $s0	
        blt	    $t1, $s2, loop
      
        la	    $a0, str	
        li	    $v0, 4	
        syscall
      
        bne	    $t1, $s2, L1
        move    $a0, $t0
        b       print
L1:     
        addi    $t0, $t0, -1
        move    $a0, $t0
        
print:
        move    $v0, 1
        syscall
        
        li	    $v0, 10
        syscall
