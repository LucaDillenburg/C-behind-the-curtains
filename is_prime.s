;"hello, world" in assembly language for Linux
;to build an executable:
;       nasm -f elf hello.asm
;       ld -s -o hello hello.o

section .text
    global _start

section .data
msg db  'Hello, world!',0xa
len equ $ - msg         ;length of our dear string

section .text

; linker puts the entry point here:
_start:

; Write the string to stdout:

    mov edx,len ;message length
    mov ecx,msg ;message to write
    mov ebx,1   ;file descriptor (stdout)
    mov eax,4   ;system call number (sys_write)
    int 0x80    ;call kernel

; exit 0
    mov ebx,0   ;process' exit code
    mov eax,1   ;system call number (sys_exit)
    int 0x80    ;call kernel - this interrupt won't return