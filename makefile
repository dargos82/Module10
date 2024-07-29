All: findPrime
LIB=libFunctions.o
CC=gcc

findPrime: findPrime.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
