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
        move $16,$2                     # move the num entered into $17

        li $2,4                         # System call code for print string
        la $4,Input                     # Argument string as Input
        syscall                         # Print the string

        li $2,5                         # System call code to read int input
        syscall                         # Read it
        move $16,$2                     # move the num entered into $18
