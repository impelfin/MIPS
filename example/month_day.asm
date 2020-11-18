# #include <stdio.h> 
# 
# int main(void) 
# { 
# 	int month, days; 
#  
# 	while(1)
# 	{
# 		printf("Enter the month you want to know the number of days(0:Exit) : "); 
# 		scanf("%d", &month); 
# 
# 		if( month == 0) break;
# 		switch(month) 
# 		{ 
# 			case 2: 
# 				days = 28; 
# 				break; 
# 			case 4: 
# 			case 6: 
# 			case 9: 
# 			case 11: 
# 				days = 30; 
# 				break; 
# 			default: 
# 				days = 31; 
# 				break; 
# 		} 
# 		printf("%d \n", days); 
# 	}
# 	return 0; 
# }

	.data
str:	.asciiz "Enter the month you want to know the number of days(0:Exit) : "
end:	.asciiz "\n"

	.text
	.globl	main

main:
	la		$a0, str
	li		$v0, 4
	syscall

	li		$v0, 5
	syscall
	
	beq		$v0, $zero, Exit
	beq		$v0,  2, d28		
	beq		$v0,  4, d30
	beq		$v0,  6, d30
	beq		$v0,  9, d30
	beq		$v0, 11, d30
	
	li		$a0, 31
	j		Print
d28:	
	li		$a0, 28
	j		Print
d30:
	li		$a0, 30
Print:	
	li		$v0, 1
	syscall

	la		$a0, end
	li		$v0, 4
	syscall

	j		main
Exit:
	li		$v0, 10
	syscall