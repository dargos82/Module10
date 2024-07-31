
.global generateRandom

.text
generateRandom:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #store maximum
    MOV r9, r0			//r9 = maximum

    #generate random number    
    MOV r0, #0
    BL time                    
    BL srand                    //integer from above becomes seed
    BL rand                     //seed used to generate random number, stored in r0

    #get number in range 1 to maximum
    MOV r4, r0			//store generated random number
    MOV r1, r9    		//modulo = maximum; move to r1
    BL __aeabi_idiv		//r0 = generated random number / modulo
    MUL r0, r0, r1		//r0 = quotient * modulo
    SUB r0, r4, r0		//r0 = remainder
    ADD r0, r0, #1            	//r0 = number to guess
    
    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr    

.data

#END generateRandom

