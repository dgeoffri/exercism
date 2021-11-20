section .text
global find
find:
    push    rbp
    push    rbx
    mov     rbp, rsp
    sub     rsp,  4
    test    esi, esi
    jz      .not_found                       ; avoid segfaulting on 0-item array
    mov     WORD [rbp - 1], 0                ; s (little-endian)
    mov     WORD [rbp - 3], si               ; e (little-endian)
    mov     rsi, rdi                         ; rsi points to array start
    xor     eax, eax                         ; clear rax so ax is ready for ret
.l1:
    mov     cx, WORD[rbp - 1]                ; load s into cx
    mov     ax, WORD[rbp - 3]                ; load e into ax
    movzx   ebx, cx                          ; too bad we can't use cx as an offset
    cmp     edx, DWORD [rsi + rbx * 4]       ; is findNumber less than first value?
    jl      .not_found                       ; then quit
    movzx   ebx, ax                          ; too bad we can't use ax as an offset
    dec     ebx
    cmp     edx, DWORD [rsi + rbx * 4]       ; is findNumber more than last value?
    jg      .not_found                       ; also quit
    sub     ax, cx                           ; distance between s and e
    shr     ax, 1                            ; divided by 2
    add     ax, cx                           ; add s back in - ax is now trypos
    movzx   ebx, ax                          ; too bad we can't use ax as an offset
    cmp     DWORD [rsi + rbx * 4], edx       ; is the middle value the sought value?
    je      .exit                            ; ==
    jg      .greater_than                    ; >
    mov     WORD[rbp - 1], ax                ; < (only option left) - s = trypos
    jmp     .l1                              ; and the game continues
.greater_than:
    mov     WORD[rbp - 3], ax                ; > - e = trypos
    jmp     .l1
.not_found:
    mov    eax, -1
.exit:
    add    rsp, 4
    pop    rbx
    pop    rbp
    ret
