section .rodata
align 16
seconds_per_year        dd    31557600.0
earth_years_per_orbit   dd    0.2408467   ; Mercury
                        dd    0.61519726  ; Venus
                        dd    1.0         ; Earth
                        dd    1.8808158   ; Mars
                        dd    11.862615   ; Jupiter
                        dd    29.447498   ; Saturn
                        dd    84.016846   ; Uranus
                        dd    164.79132   ; Neptune

section .text
global find_age
find_age:
    movsd               xmm1, [rel seconds_per_year]
    lea                 rdx, [rel earth_years_per_orbit]
    movsd               xmm0, [rdx + rdi * 4]
    mulss               xmm1, xmm0
    cvtsi2ss            xmm0, esi
    divss               xmm0, xmm1
    ret
