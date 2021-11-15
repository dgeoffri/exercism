section .text
global is_isogram
is_isogram:
    push        rbp         ; save old base pointer
    sub         rsp, 26     ; allocate local 'seen' array
    mov         rbp, rsp
    mov         rsi, rdi    ; save char * for word to check
    mov         rdi, rbp
    mov         ecx, 26
    xor         al, al
    rep stosb               ; and zero
.l1:
    lodsb                   ; get letter from word
    test         al, al     ; check for end of string
    je           .success   ; if we made it this far
                            ; then the word is an isogram
    or           al, 0x20   ; convert to lowercase
    cmp          al, 'a'    ; check character is alpha
    jb           .notalpha  ; skip over non-letters
    cmp          al, 'z'
    ja           .notalpha
    sub          al, 'a'    ; align 'a' with array start
    movzx        rcx, al    ; offset into array
    mov          ah, BYTE [rbp + rcx]
    test         ah, ah
    jnz          .fail      ; oops, collision
    inc          BYTE [rbp + rcx]
.notalpha:
    jmp          .l1        ; loop
.fail:
    mov          rax, 0
    jmp          .done
.success:
    mov          rax, 1
.done:
    add          rsp, 26
    pop          rbp
    ret
