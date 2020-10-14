section .data

section .text
    global _start
    extern main

_start:
    ; Stack now: envp, argv, argc

    xor ebp, ebp ; Mark the outermost frame
    pop esi      ; argc
    mov ecx, esp ; argv
    and esp, 0xfffffff0 ; Stack pointer alignment for efficiency
    
    ; Parameters in inverse order
    push eax ; Garbage
    push eax ; Garbage
    push eax ; Garbage
    push eax ; Garbage
    push eax ; Garbage
    ;push eax ; Garbage

    push ecx ; argv
    push esi ; argc

    call main

    ; exit-syscall
    mov eax, 1
    mov ebx, 0
    int 0x80
