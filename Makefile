compile:
	gcc -o sieve sieve.c -lm

	nasm -f elf32 is_prime.s -o is_prime.o
	gcc -m32 sieve_asm.c is_prime.o -o sieve_asm -lm

clean:
	rm sieve is_prime.o sieve_asm
