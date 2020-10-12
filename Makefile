compile:
	gcc -o sieve sieve.c -lm

	nasm -f elf32 is_prime.s
	ld -m elf_i386 -o is_prime is_prime.o

	gcc -o sieve_asm sieve_asm.c -lm

# sieve.c:
# 	gcc -o sieve sieve.c -lm

# sieve_asm.c: is_prime.s
# 	gcc -o sieve_asm sieve_asm.c -lm

# is_prime.s:
# 	nasm -f elf32 is_prime.s
# 	ld -m elf_i386 -o is_prime is_prime.o

clean:
	rm sieve is_prime.o is_prime
