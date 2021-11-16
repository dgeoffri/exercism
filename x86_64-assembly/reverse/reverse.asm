section .text
global reverse
reverse:
    ; Provide your implementation here
    mov    rsi,    rdi
    xor    al,     al
    cld
    repne  scasb
    sub    rdi, 2
    push   rsi
.l1:
    mov    ah,      [rsi]
    mov    al,      [rdi]
    mov    [rdi],   ah
    mov    [rsi],   al
    inc    rsi
    dec    rdi
    cmp    rsi, rdi
    jle    .l1
    pop    rax
    ret
