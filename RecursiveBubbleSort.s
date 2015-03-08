	.data
	.align 4
Values: .space 32    # declares 32 bytes of storage for 8 inputs to be inserted in the Values array 
InputString: .asciiz "Please enter an integer to insert in the array: "
EmptyString: .asciiz " "
SolutionString: .asciiz "\nThe values after the bubble sort implementation are: "
	.text
	.globl main

main:

	addi $s0,$zero,7    #adding 8 items into $s0 as index starts from 0 to 7
	addi $t0,$zero,0    #temporary register $t0 assigned 0

printingStrings:

	li $2,4		    # $2 is assigned 4	
	la $4,InputString   #load base address of InputString to $4 
	syscall

	li $2,5		    #$2 is assigned 5
	syscall

	add $t1,$t0,$zero   #temporary register $t1 is assigned 0
	sll $t1,$t0,2 
	add $t3,$2,$zero      
	sw $t3,Values($t1)
	addi $t0,$t0,1
	slt $t1,$s0,$t0
	beq $t1,$zero,printingStrings        #allows for looping again to print 8 times

	la $4,Values
	addi $a1,$s0,1   
			     
	jal bubblesort	     

	li $2,4
	la $4,SolutionString
	syscall			#print Values
	la $t0,Values
	add $t1,$zero,$zero

printValues:

	lw $4,0($t0)
	li $2,1
	syscall

	li $2,4
	la $4,EmptyString
	syscall

	addi $t0,$t0,4
	addi $t1,$t1,1
	slt $t2,$s0,$t1
	beq $t2,$zero,printValues
	li $2,10
	syscall

bubblesort:

	add $t0,$zero,$zero     

# the loops must be after the bubble sort
# if they are placed before it just keeps looping infinitely

outerforloop:

	addi $t0,$t0,1 		# this increments the index i, i = i + 1
	bgt $t0,$a1,Exit        #branch to Exit if t0 > a1
	add $t1,$a1,$zero      

innerforloop:
	
	slt $t3, $t1,$t0
	bne $t3,$zero,outerforloop

	addi $t1,$t1,-1 	# this decrements the index j, j = j - 1

	mul $t4,$t1,4 	
	addi $t3,$t4,-4 	
	add $t7,$t4,$4	 	
	add $t8,$t3,$4	 	
	lw $t5,0($t7)
	lw $t6,0($t8)
	bgt $t5,$t6,innerforloop    #branch to innerforloop if $t5 > $t6

	#using the store word instruction we can swap the values of $t5 and $t6

	sw $t5,0($t8)
	sw $t6,0($t7)   
	j innerforloop



Exit:

	jr $ra