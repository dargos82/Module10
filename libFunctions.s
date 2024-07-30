
.global generateRandom

.text
generateRandom:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #store maximum
    MOV r2, r0			//r2 = maximum

    #generate random number    
    //MOV r0, #256
    BL time                    //see if this works, should return an integer in r0; otherwise need to get a seed value
    BL srand                    //integer from above becomes seed
    BL rand                    //seed used to generate random number, stored in r0

    #get number in range 0 to maximum
    MOV r3, r0			//store generated random number
    MOV r1, r2    		//modulo = maximum; move to r1
    BL __aeabi_idiv		//r0 = generated random number / modulo
    MUL r0, r0, r1		//r0 = quotient * modulo
    SUB r0, r3, r0		//r0 = remainder
    ADD r0, r0, #1      //r0 = number to guess
    
    //BL rand
    //MOV r1, r0
    //LDR r0, =output
    //BL printf

    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr    

.data

#END generateRandom

