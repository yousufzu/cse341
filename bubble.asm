# Bubble sort
        .data
        .align	2
        .space	12
list:	.space	1000			# Can hold 250 ints - just use it for now
listsz:	.word 	250
String: .space	16
Input:  .asciiz "\nEnter an integer "
        .text
        .globl main

main:
        lw $s0, listsz			# Dimension
	la $s1, list			# Address
	li $s4, 0			# Number of items intialized
	j loop
	li $s7, 0
	j Sort
	j Print
	j Exit

loop:
	li $v0, 4			# System call code for print string
	la $a0, Input			# Argument string as Input
	syscall
	
	li $v0, 5			# System call code to read int input
	syscall				# Read it
	move $t0, $v0			# Move to temp address
	
	slti $s2, $t0, 0		# If input is less than 0, $s2 is 1
	bne $s2, 0, $ra			# Branch if $s2 != 0
	
	add $t1, $s1, $s4
	sw $t0, 0($t1)			# Move into array
	sll $s4, $s4, 2			# Move to next index in array

	j loop

Sort:
	add $t1, $s4, 0
	srl $s2, $t1, 2			# Number of items in array
	move $s4 , $s2			# Constant array size
	
	j bloop
	j $ra

bloop:
	beq $s2, 0, $ra
	li $s3, 0			# Initial array address
	j iloop
	addi $s2, $s2, -1
	j bloop

iloop:
	beq $s2, $s3, $ra
	addi $t3, $s3, 1
	sll $t4, $s3, 2
	sll $t5, $t3, 2
	add $t4, $t4, $s1		# Address of first
	add $t5, $t5, $s1		# Address of second

	lw $t7, 0($t4)
	lw $t8, 0($t5)

	slt $t6, $t7, $t8		# $t6 is 1 if A[n] < A[n+1]
	addi $s3, $s3, 1		# Increment first
	addi $t3, $t3, 1		# Increment second

	bne $t6, 0, iloop		# If $t6 == 1, go through loop again
	
	sw $t8, 0($t4)
	sw $t7, 0($t5)
	j iloop

Print:
	beq $s7, $s4, $ra
	sll $t0, $s7, 2
	add $t1, $t0, $s1		# Address space
	lw $t2, 0($t1)			# Load integer
	li $v0, 1
	move $a0, $t2
	syscall

	addi $s7, $s7, 1
	j Print
	
Exit:
        li $2,10                        # System call code for exit
        syscall                         # exit



