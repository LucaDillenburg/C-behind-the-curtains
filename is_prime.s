global is_prime

section .data

section .text
is_prime:

    ; *** Standard subroutine prologue ***
    ; The reason for this initial action is the maintenance of the base pointer, EBP (base pointer). The caller isn’t expecting the subroutine to change the value of the base pointer, so we will store its value somewhere before overwritting it with the point of reference for accessing parameters and local variables.
    push ebp
    mov ebp, esp

    ; To allocate space for local variables you just need to decrement the stack pointer since the stack grows downwards
    ; We need 2 int (4 bytes) variables: iterative division and last division
    sub esp, 8

    ; TODO: the division check could start with 3 and increment in twos

    ; [EBP+8] is the first parameter and thus the number wich should be checked if it's prime
    ; [ESP+4]: iterative division
    ; [ESP+8]: last division check (param - 1)
    ; TODO: EDX can be the square root of the parameter
    ; EAX: return value
    mov [esp+4], 2
    mov [esp+8], [ebp+8]
    dec [esp+8]
    mov eax, 1

    prime_loop:
        ; Modulus operation
        mov eax, [ebp+8] ; dividend low half
        mov edx, 0       ; dividend high half = 0
        div [esp+4]      ; Divides 1234 by 10.
        ; EDX : remainder
        
        ; Check if it is divisible by the divisor
        cmp edx, 0
        jne end_of_loop
        mov aex, 0
        jmp end_method

        end_of_loop:
        inc [esp+4]
        
        cmp [esp+4], [esp+8]
        jle prime_loop

    mov aex, 1
    end_method:

    ; From this point on the return value should be on the EAX register

    ; To deallocate the space used for the variables you just need to decrement the ESP (stack pointer). Since EBP (base pointer) wasn't changed since it was set to EBP, we can do the following:
    mov esp, ebp

    ; Restore the caller base pointer by popping it from the stack
    pop ebp

    ; This instruction will find the return address in the stack and change the PC register jumping to the 
    ret
