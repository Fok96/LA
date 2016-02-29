# Calculate sums of positive odd and negative even values in an array
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, length       # get address of length to $a0
        lw         $a0, 0($a0)       # get the length in to $a0

        la         $a1, input        # get address of array to $a1
        la         $a2, length       		
        lw         $a2, 0($a2) 	
	la  	   $a0, input
        addiu      $s0, $0, 0     # sum of positive odd values starts as 0
        addiu      $s1, $0, 0     # sum of negative even values starts as 0

        add 	$s2,$0,$0
loop:
	beq	$s2,$a2,eloop 		#start of loop
	addi	$s2,$s2,1 		
	lw	$s3,0($a0)
	
	slti	$t5,$s3,0		#if s3 < 0 goto neg
	bne	$t5,$0,neg
	j	pos 			#else goto pos
	
neg: 
	andi	$t6,$s3,1
	beq	$t6,$0,equal
	j 	skip
equal:
	add 	$s1,$s1,$s3
	j 	skip

pos:
	andi	$t7,$s3,1
	bne 	$t7,$0,odd
	j skip
odd:
	add	$s0,$s0,$s3
skip:
	addi	$a0,$a0,4
	j loop
eloop:
	
	
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
length: .word 5 # Number of values in the input array
input:  .word 3, -2, 0, 4, -1
