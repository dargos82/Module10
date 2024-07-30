
.global generateRandom

.text
generateRandom:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]
    
    #if (r6 > r7 && r6 > r8)
    MOV r1, #0
    CMP r6, r7
    ADDGT r1, #1		//if r6 > r7, r1 = 1

    MOV r2, #0
    CMP r6, r8
    ADDGT r2, #1		//if r6 > r8, r2 = 1

    AND r2, r1, r2		//r2 = 1 if r1 = 1 AND r2 = 1 (r6 is max)
    MOV r1, #1
    CMP r2, r1
    BNE secondValue
	MOV r0, r6
	B endIf     

    secondValue:
	#else if (r7 > r6 && r7 > r8)
	MOV r1, #0
    	CMP r7, r6
 	ADDGT r1, #1		//if r7 > r6, r1 = 1

        MOV r2, #0
        CMP r7, r8
        ADDGT r2, #1		//if r7 > r8, r2 = 1

        AND r2, r1, r2		//r2 = 1 if r1 = 1 AND r2 = 1 (r7 is max)
        MOV r1, #1
        CMP r2, r1
        BNE thirdValue
	   MOV r0, r7
	   B endIf     

    thirdValue:
	#else if (r8 > r6 && r8 > r7)
	MOV r1, #0
    	CMP r8, r6
 	ADDGT r1, #1		//if r8 > r6, r1 = 1

        MOV r2, #0
        CMP r8, r7
        ADDGT r2, #1		//if r8 > r7, r2 = 1

        AND r2, r1, r2		//r2 = 1 if r1 = 1 AND r2 = 1 (r8 is max)
        MOV r1, #1
        CMP r2, r1
        BNE error
	   MOV r0, r8
	   B endIf     

    error:
	#else max not identified
	MOV r0, #-1
	B endIf

    endIf:

    #pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr    

.data

#END findMaxOf3

