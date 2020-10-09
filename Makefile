sieve.c:
	gcc -o sieve sieve.c -lm

sieve_asm.c: is_prime.s
	gcc -o sieve sieve.c -lm

is_prime.s:
	nasm -f elf32 is_prime.s
	ld -m elf_i386 -o is_prime is_prime.o
