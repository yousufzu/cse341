        .data
        .align 2
        .space 12
String: .space 16
Input:  .asciiz "\nEnter an integer number between (0 and 10) = "
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
