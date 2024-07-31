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
   
    MOV r0, #0
    BL time                    //see if this works, should return an integer in r0
    BL srand                    //integer from above becomes seed
    BL rand                    //seed used to generate random number
    
    MOV r1, r0
    LDR r0, =output
    BL printf
    BL rand
    MOV r1, r0
    LDR r0, =output
    BL printf

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

