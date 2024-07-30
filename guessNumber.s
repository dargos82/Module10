#Program Name: guessNumber.s
#Author: David Blossom
#Date: 4 August 2024
#Purpose: Guess a randomly generated number
#Input: maximum - integer
#Output: output - calculated prime numbers
#Ref:
#Program dictionary:
#	r4: generated number
#	r5: maximum
#	r6: guess
#	r7: number of guesses
#	r8: 
#	r9: 


.text
.global main
main:

    #push the stack
    SUB sp, sp, #28
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]
    STR r6, [sp, #12]
    STR r7, [sp, #16]
    STR r8, [sp, #20]
    STR r9, [sp, #24]

    #prompt user 
    LDR r0, =prompt1
    BL printf

    #read user input
    LDR r0, =maximumFormat
    LDR r1, =maximum
    BL scanf

    #move maxiumum to r5		//r5 has the upper bound
    LDR r5, =maximum
    LDR r5, [r5]

    #generate number
    MOV r0, r5				//move maximum to r0 for use by generateRandom
    BL generateRandom
    MOV r4, r0				//r4 = generated random number
    //MOV r4, #50			//temporary until figure out random number

    #Initialize outer loop
    MOV r7, #0				//initialize number of guesses to 0

    StartOuterLoop:
	#check limit	
	
	#get the guess
    	MOV r1, r5
    	LDR r0, =guessPrompt
    	BL printf
	
    	#store the guess
    	LDR r0, =guessFormat
    	LDR r1, =guess
    	BL scanf
	
    	#move guess to r6		//r6 has the guess
    	LDR r6, =guess
    	LDR r6, [r6]
	
	ADD r7, r7, #1			//increment counter
	CMP r6, r4			//check if guess is correct
	BEQ EndOuterLoop		//if guess = generated number, exit loop

	#loop statement

	#Initialize inner loop
	
	StartInnerLoop:
	    #check limit
	    	    
	    #loop statement
	    
	    #get next value
	
	EndInnerLoop:	

	#get next value

    EndOuterLoop:
	MOV r1, r7
	LDR r0, =correctGuess
	BL printf	
	   
    #pop the stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    LDR r6, [sp, #12]
    LDR r7, [sp, #16]
    LDR r8, [sp, #20]
    LDR r9, [sp, #24]
    ADD sp, sp, #28
    MOV pc, lr

.data
    #prompt for input
    prompt1:	.asciz  "\nEnter a positive number: "
    
    #format for maximum input
    maximumFormat:	.asciz  "%d"
   
    #number variable
    maximum:	.word	0

    #prompt for guess
    guessPrompt:	.asciz	"Please enter a number between 0 and %d.\n"

    #format for guess
    guessFormat:	.asciz	"%d"

    #number for guess
    guess:	.word	0

    #output for correct guess
    correctGuess:	.asciz	"\nCongratulations!  You guessed the number in %d guess(es)!"

