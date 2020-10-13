section .data

section .text
    global print_asm

print_asm:

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Standard subroutine prologue
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; The reason for this initial action is the maintenance of the base pointer, EBP (base pointer). The caller isn’t expecting the subroutine to change the value of the base pointer, so we will store its value somewhere before overwritting it with the point of reference for accessing parameters and local variables.
    push ebp
    mov ebp, esp

    ; Since I will use the EBX register, I will have to store its value
    push ebx

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; CORE ALGORITHM
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov ecx, [ebp+12] ;message to write
    mov edx, [ebp+8]  ;message length
    mov ebx, 1        ;file descriptor (stdout)
    mov eax, 4        ;system call number (sys_write)
    int 0x80          ;call kernel

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; STANDARD SUBROUTINE EPILOGUE
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    end_method:

    ; From this point on the return value should be on the EAX register

    ; Since I changed EBX register, I will have to restore its value
    pop ebx

    ; To deallocate the space used for the variables you just need to decrement the ESP (stack pointer). Since EBP (base pointer) wasn't changed since it was set to EBP, we can do the following:
    mov esp, ebp

    ; Restore the caller base pointer by popping it from the stack
    pop ebp

    ; This instruction will find the return address in the stack and change the PC register jumping to the 
    ret
