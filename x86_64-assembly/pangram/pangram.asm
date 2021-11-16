section .text
global is_pangram
is_pangram:
    xor          edx, edx
    xor          eax, eax
    xchg         rdi, rsi
    cld
.l1:
.notalpha:
    lodsb                       ; get letter from word
    test         al, al         ; check for end of string
    je           .finaltest     ; moment of truth
                                ; let's go see what we got
    or           al, 0x20       ; convert to lowercase
    cmp          al, 'a'        ; check character is alpha
    jb           .notalpha      ; skip over non-letters
    cmp          al, 'z'
    ja           .notalpha
    sub          al, 'a'        ; align 'a' with bit 0
    bts          edx, eax
    jmp          .l1
.finaltest:
    xor          eax, eax
    mov          cx, 1
    cmp          edx, 0x3ffffff ; check that first 26 bits are all set
    cmove        ax, cx
    ret
