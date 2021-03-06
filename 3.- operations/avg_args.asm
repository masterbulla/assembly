;avg_args.asm
;prints average of numbers in args.
;author: Erick
;date: 2017/03/29

%include '../2.- functions/functions.asm'

section .data
    msg db "The average is ", 0x0

segment .bss
    num_args resb 4

section .text
    GLOBAL _start

_start:
    pop ecx                                          ;gets # of args

    cmp ecx, 2                                       ;compare args to 1 (make sure at least 1 number is arg)
    jl quit                                          ;jump if less

    dec ecx
    pop eax                                          ;pops first arg

    mov [num_args], ecx                              ;mov num of args to var

cycle:
    pop eax
    call atoi
    add ebx, eax

    dec ecx                                          ;decrement ecx by 1
    cmp ecx, 0                                       ;check if ecx  == 0
    jnz cycle                                        ;if not z, loop again

    mov eax, msg
    call sprint                                      ;print msg
    
    mov eax, ebx                                     ;move the sum of args to eax
    mov ecx, [num_args]                              ;mov num args to ebx

    idiv ecx                                         ;idiv divides eax by the given register (ebx)
    call iprintLF                                    ;prints avg

    jmp quit