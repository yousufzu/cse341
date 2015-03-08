# Bubble sort
        .data
        .align	2
        .space	12
list:	.space	40			# Can hold 10 ints
EmptyString: .asciiz " "
String: .space	16
SolutionString: .asciiz "\nThe values after the bubble sort are: "
Input:  .asciiz "\nEnter an integer: "
        .text
        .globl main

main:
	la $s1, list			# Address
	li $s4, 0			# Number of items intialized
	li $s0, 10
loop:
	li $v0, 4			# System call code for print string
	la $a0, Input			# Argument string as Input
	syscall
	
	li $v0, 5			# System call code to read int input
	syscall				# Read it
	move $t0, $v0			# Move to temp address
	
	
	sll $t2, $s4, 2
	add $t1, $s1, $t2		# Address of item
	sw $t0, 0($t1)			# Move into array
	addi $s4, $s4, 1		# Move to next index in array
	
	bne $s4, $s0, loop		# Branch if $t2 != $s0

	addi $s2, $s4, -1
bloop:
	beq $s2, $zero, Print
	li $s3, 0			# Initial array address
	j iloop
iloop:
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
	
	sw $t8, 0($t4)			# Swap Values
	sw $t7, 0($t5)

	add $t0, $s2, -1
	bne $s3, $t0, iloop		# If not at end, loop again

	addi $s2, $s2, -1		# Decrement index
	j bloop

Print:
	li $2,4
	la $4,SolutionString
	syscall			

	la $t0, list
	add $t1,$zero,$zero


printValues:

	lw $4,0($s1)
	li $2,1
	syscall


	li $2,4
	la $4,EmptyString
	syscall


	addi $s1,$s1,4
	addi $t1,$t1,1
	slt $t2,$s0,$t1
	beq $t2,$zero,printValues

	j Exit


Exit:
        li $2,10                        # System call code for exit
        syscall                         # exit



