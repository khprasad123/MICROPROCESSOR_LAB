.model small
.stack
displaym macro msg
    mov ah,09h
    lea dx,msg
    int 21h
endm

.data
    matrix db 01,02,03,04
    col     db 2
    row     db 2
    ;  offst   db 0
    ent     db 13,10,"$"
    space   db " ","$"
.code
main proc
    mov ax,@data
    mov ds,ax
    lea si,matrix
    xor cx,cx
    xor bx,bx
    mov bl,00
    outer:
            xor cx,cx
            mov ch,00
                inner:
                      mov al,ch
                      mul row
                      add al,bl
                      push bx
                      xor bx,bx
                      mov bl,al
                      mov dl,[si+bx]
                      pop bx
                      mov ah,02h
                      mov dl,30h
                      int 21h
                      displaym space
                      inc ch
                      cmp ch,row
                      jl inner
                displaym ent
                inc bl
                cmp bl,row
                jl outer
     mov ah,4ch
     int 21h
main endp
end main     
            