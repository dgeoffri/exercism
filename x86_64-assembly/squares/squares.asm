section .text
global square_of_sum
square_of_sum:
    mov        eax,  edi
.l1:
    dec        edi
    jz         .done
    add        eax,  edi
    jmp        .l1
.done:
    mul        eax
    ret

global sum_of_squares
sum_of_squares:
    xor        ecx, ecx
.l1:
    mov        eax, edi
    mul        eax
    add        ecx, eax
    dec        edi
    jnz        .l1
    mov        eax, ecx
    ret

global difference_of_squares
difference_of_squares:
    push       rbx
    push       rdi
    call       square_of_sum
    mov        ebx, eax
    pop        rdi
    call       sum_of_squares
    sub        ebx, eax
    mov        eax, ebx
    pop        rbx
    ret
