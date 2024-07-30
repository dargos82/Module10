#Program Name: guessNumber.s
#Author: David Blossom
#Date: 4 August 2024
#Purpose: Guess a randomly generated number
#Input: maximum - integer; guess - integer; control - integer
#Output: prompt - get maximum value for range; guessPrompt - get the user's guess; correctGuess - output when number is guessed;
#controlPrompt - get user input to continue or quit; endGame - output when game is ended; tooHigh - output when guessed number
#is too high; tooLow - output when guessed number is too low
#Ref:
#Program dictionary:
#	r4: generated number
#	r5: maximum
#	r6: guess
#	r7: number of guesses
#	r8: outer loop control
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

    #prompt user for maximum value of range
    LDR r0, =prompt1
    BL printf

    #read user input			//scan and load maximum value of range
    LDR r0, =maximumFormat
    LDR r1, =maximum
    BL scanf

    #move maxiumum to r5		//r5 has the maximum value
    LDR r5, =maximum
    LDR r5, [r5]

    #generate number
    MOV r0, r5				//move maximum to r0 for use by generateRandom
    BL generateRandom
    MOV r4, r0				//r4 = generated random number
    //MOV r4, #50			//temporary until figure out random number

    MOV r8, #0				//initialize outer loop control to 0
    MOV r7, #0				//initialize number of guesses to 0
    
    StartOuterLoop:
    #Initialize outer loop
    MOV r0, #2
    CMP r8, r0
    BEQ EndOuterLoop			//if player has not selected to quit, go to inner loop
    	
   	#loop statement

	StartInnerLoop:
	    #Initialize inner loop
	    	    	    
	    #loop statement

     	    #get the guess		//prompt for guess
    	    MOV r1, r5
    	    LDR r0, =guessPrompt
    	    BL printf
	
    	    #store the guess		//scan and load the guess
    	    LDR r0, =guessFormat
    	    LDR r1, =guess
    	    BL scanf
	
    	    #move guess to r6		//r6 = guess
    	    LDR r6, =guess
    	    LDR r6, [r6]
	
	    ADD r7, r7, #1		//increment counter
     
	    CMP r6, r4			//check if guess is correct
	    BEQ EndInnerLoop		//if guess = generated number, exit loop

     	    CMP r6, r4
	    BGT tooHigh

     	    CMP r6, r4
	    BLT tooLow
	    
     	    tooHigh:
	  	LDR r0, =tooHigh
    		B StartInnerLoop

      	    tooLow:
	   	LDR r0, =tooLow
     		B StartInnerLoop
	
	EndInnerLoop:	

	MOV r1, r7			//move number of guesses from r7 to r1 for printing
	LDR r0, =correctGuess
	BL printf
	
 	#get next value			//prompt for user control input
  	LDR r0, =controlPrompt
   	BL printf

        #store the guess		//scan and load user control input
    	LDR r0, =controlFormat
    	LDR r1, =control
    	BL scanf

 	LDR r8, =control		//load r8 with user control input
  	LDR r8, [r8]
        B StartOuterLoop   	

    EndOuterLoop:
    LDR r0, =endGame
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
    prompt1:	.asciz  "\nEnter a positive number for maximum value of guessing range: \n"
    
    #format for maximum input
    maximumFormat:	.asciz  "%d"
   
    #number variable
    maximum:	.word	0

    #prompt for guess
    guessPrompt:	.asciz	"Please enter a number between 1 and %d: \n"

    #format for guess
    guessFormat:	.asciz	"%d"

    #number for guess
    guess:	.word	0

    #output for correct guess
    correctGuess:	.asciz	"\nCongratulations!  You guessed the number in %d guess(es)!"

    #output for game control
    controlPrompt:	.asciz	"\nWould you like to play again? 1 to continue; 2 to quit: /n"

    #control format
    controlFormat:	.asciz	"%d"

    #control value
    control:	.word	0

    #end statement
    endGame:	.asciz	"/nThank you for playing!"

    #too high statement
    tooHigh:	.asciz	"/nToo high!  Try again./n"

    #too low statement
    tooLow:	.asciz	"/nToo low!  Try again./n"

