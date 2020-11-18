.data
Dividend:     .asciiz "\nPlease Enter the Dividend: "
Divisor:      .asciiz "\nPlease Enter the Divisor: "
Result:       .asciiz "\nThe Result of the Division is: "
Quotient:     .asciiz "\nContents of Register LO (Quotient): "
Remainder:    .asciiz "\nContents of Register HI (Remainder): "

.text
.globl main

main: 
     li $v0, 4
     la $a0, Dividend
     syscall

     li $v0, 5
     syscall
     add $t0, $v0, $zero

     li $v0, 4
     la $a0, Divisor
     syscall

     li $v0, 5
     syscall
     add $t1, $v0, $zero

     div $t0, $t1

     li $v0, 4
     la $a0, Result
     syscall

     li $v0, 4
     la $a0, Quotient
     syscall

     li $v0, 1   
     mflo $a0
     syscall

     li $v0, 4
     la $a0, Remainder
     syscall

     li $v0, 1
     mfhi $a0
     syscall

End_Prog:
     li $v0, 10
     syscall