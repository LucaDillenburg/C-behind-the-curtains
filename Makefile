compile:
	nasm -f elf32 _start.s -o _start.o
	nasm -f elf32 print.s -o print.o
	nasm -f elf32 is_prime.s -o is_prime.o

	gcc -o sieve sieve.c -lm
	gcc -m32 sieve_asm.c is_prime.o -o sieve_asm -lm
	gcc -m32 sieve_nostdlib.c _start.o print.o is_prime.o -o sieve_nostdlib -nostdlib

clean:
	rm _start.o is_prime.o print.o sieve sieve_asm sieve_nostdlib
