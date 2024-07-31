All: findPrime guessNumber random
LIB=libFunctions.o
CC=gcc

findPrime: findPrime.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

guessNumber: guessNumber.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

random: random.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
