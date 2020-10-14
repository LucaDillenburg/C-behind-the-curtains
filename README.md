# C behind the curtains (Assembly Integration)

## Objetive
To understand how a C program runs runs the curtain by writing assembly code that starts a C program, calls functions written in C, implements functions that are called in a C program, and replaces the basic functionality of the C standard library.

Most other programming languages do things similarly.

## Requirements
- C 32 bit standard libraries
- nasm installed

## Compile and Run

#### Compile
```sh
make # or "make compile"
```

#### Delete executables and compiled files
```sh
make clean
```

#### Run
```sh
./sieve_nostdlib # you can also run the versions with the stdlib ("./sieve_asm") and with the algorithm in CLang ("./sieve")
```

## Author
Luca Assumpção Dillenburg (NUSP: 11796580)
