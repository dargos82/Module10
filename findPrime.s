#Program Name: findPrime.s
#Author: David Blossom
#Date: 4 August 2024
#Purpose: Find and print the prime numbers between 3 and a user input value
#Input: number1 - integer
#Output: output - calculated prime numbers
#Ref: https://prepinsta.com/java-program/prime-numbers-in-a-given-range-using-java/
#Program dictionary:
#	r4: outer loop counter
#	r5: outer loop limit
#	r6: inner loop counter
#	r7: inner loop limit
#	r8: dividend
#	r9: remainder


.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #prompt user 
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =number1Format
    LDR r1, =number1
    BL scanf

    #move number to r5
    LDR r5, =number1
    LDR r5, [r5]

    #Initialize outer loop
    MOV r4, #3				//verify this

    StartOuterLoop:
	#check limit	
	MOV r3, #3
	CMP r4, r3
	LDR r0, =output
	MOV r1, r4
	BLEQ printf
	CMP r4, r5			//compare counter to limit
	BGT EndOuterLoop		//exit if counter > limit

	#loop statement

	#Initialize inner loop
	MOV r6, #2			//initial divisor

	MOV r0, r4			
	MOV r1, #2
	BL __aeabi_idiv			//divide r4 by 2; r0 = inner loop limit
	MOV r7, r0			//r7 has r4/2; this is limit for inner loop
	
	StartInnerLoop:
	    #check limit
	    CMP r6, r7
	    BGT EndInnerLoop
	    	    
	    #loop statement
	    MOV r0, r4
	    MOV r1, r6
	    BL __aeabi_idiv
	    MOV r8, r0
	    MUL r9, r6, r8
	    SUB r9, r4, r9		//r9 has the remainder
	    MOV r0, #0
	    CMP r0, r9			//check if remainder is 0
	    BEQ EndInnerLoop	    	//if remainder is 0, r4 is not prime; exit loop

	    #get next value
	    CMP r6, r7
	    LDR r0, =output
	    MOV r1, r4
	    BLEQ printf

	    ADD r6, r6, #1
	    B StartInnerLoop
	
	EndInnerLoop:	

	#get next value
	ADD r4, r4, #1
	B StartOuterLoop

    EndOuterLoop:
	
	   
    #pop the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    #prompt for input
    prompt1:	.asciz  "\nEnter a positive number: "
    
    #format for first input
    number1Format:	.asciz  "%d"
   
    #number variable
    number1:	.word	0

    #output prime numbers
    output:	.asciz	"%d\n"

