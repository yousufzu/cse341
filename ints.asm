#This amazing program will take 3 integers and print the sum of the largest two of the three
        .data
        .align 2
        .space 12
String: .space 16
Input:  .asciiz "\nEnter an integer "
        .text
        .globl main

main:
        li $2,4                         # System call code for print string
        la $4,Input                     # Argument string as Input
        syscall                         # Print the string

        li $2,5                         # System call code to read int input
        syscall                         # Read it
        move $16,$2                     # move the num entered into $16

        li $2,4                         # System call code for print string
        la $4,Input                     # Argument string as Input
        syscall                         # Print the string

        li $2,5                         # System call code to read int input
        syscall                         # Read it
        move $17,$2                     # move the num entered into $17

        li $2,4                         # System call code for print string
        la $4,Input                     # Argument string as Input
        syscall                         # Print the string

        li $2,5                         # System call code to read int input
        syscall                         # Read it
        move $18,$2                     # move the num entered into $18

	add $19, $16, $17
	add $20, $16, $18
	add $21, $18, $17

	slt $22, $19, $20		# if $19 < $20, $22 = 1, otherwise 0
	beq $22, 1, A
	slt $22, $19, $21		# if $19 < $21, $22 = 1, otherwise 0
	beq $22, 1, Print21
        li $2,1                         # system call code for print int
        move $4,$19                     # return_value as argument
        syscall
	b Exit

A:
	slt $22, $20, $21		#if 20 < 21, 22 = 1, otherwise 0
	beq $22, 1, Print21
	li $2,1                         # system call code for print int
        move $4,$20                     # return_value as argument
        syscall	
	b Exit


Print21:
	li $2,1                         # system call code for print int
        move $4,$21                     # return_value as argument
        syscall
	b Exit

Exit:
        li $2,10                        # System call code for exit
        syscall                         # exit



