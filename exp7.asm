.model small
.stack
disply macro msg
    mov ah,09h
    lea dx,msg
    int 21h
endm
.data
    matrix db 01,02,03,04,05,06,07,08,09
    row     db 3
    col     db 3
    ent     db 13,10,"$"
    space   db " ","$"
.code
main proc
    mov ax,@data
    mov ds,ax
    lea si,matrix
    xor bx,bx
    mov bl,00   ;for i=0
        outer:
               xor cx,cx
               mov ch,00    ;for j=0
               inner:
                    mov al,ch
                    mul row
                    add al,bl
                    push bx
                    xor bx,bx
                    mov bl,al
                    mov dl,[si+bx]
                    pop bx
                    add dl,30h
                    mov ah,02
                    int 21h
                    inc ch
                    disply space
                    cmp ch,row
                    jl inner
               inc bl
               disply ent
               cmp bl,col
               jl outer
         mov ah,4ch
         int 21h
main endp
end main   
    
    