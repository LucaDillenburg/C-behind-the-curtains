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


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; DECLARE AND INITIALIZE VARIABLES
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; To allocate space for local variables you just need to decrement the stack pointer since the stack grows downwards
    ; We need 2 int variables: iterative division and last division
    ; Each int variable in C 32bit is 4 bytes and so is dword in assembly
    sub esp, 8

    ; TODO: the division check could start with 3 and increment in twos

    ; [EBP+8] is the first parameter and thus the number wich should be checked if it's prime
    ; [EBP-4]: iterative division variable
    ; [EBP-8]: last division check variable
    ; TODO: EDX can be the square root of the parameter
    ; EAX: return value
    mov dword [ebp-4], 2
    mov eax, dword [ebp+8]
    mov dword [ebp-8], eax
    dec dword [ebp-8]


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; CORE ALGORITHM
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; one is not prime
    cmp dword [ebp+8], 1
    je return_is_not_prime

    prime_loop:
        mov eax, [ebp-8]
        cmp [ebp-4], eax
        jg return_is_prime

        ; Modulus operation
        mov eax, [ebp+8] ; dividend low half
        mov edx, 0       ; dividend high half = 0
        div word [ebp-4] ; divides (high: edx, low: aex) by [esp+3] and stores the remainder in EDX
        
        ; Check if it is divisible by the divisor
        cmp edx, 0
        je return_is_not_prime

        end_of_loop:
        inc word [ebp-4]
        jmp prime_loop


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; RETURNS
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    return_is_prime:
    mov eax, 1
    jmp end_method

    return_is_not_prime:
    mov eax, 0


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; STANDARD SUBROUTINE EPILOGUE
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    end_method:

    ; From this point on the return value should be on the EAX register

    ; To deallocate the space used for the variables you just need to decrement the ESP (stack pointer). Since EBP (base pointer) wasn't changed since it was set to EBP, we can do the following:
    mov esp, ebp

    ; Restore the caller base pointer by popping it from the stack
    pop ebp

    ; This instruction will find the return address in the stack and change the PC register jumping to the 
    ret
