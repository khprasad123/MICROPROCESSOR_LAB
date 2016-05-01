;EXP4: HEX TO DECIMAL CONVERSION
;HARIPRASAD K
;29/01/2016
;ROLL NO:29


.model small
.stack
.data
num           dw ffff
.code
main proc          
          mov ax,@data
          mov ds,ax
          mov ax,num
          mov cx,0
          mov bx,10
loop1:          mov dx,0
          div bx
          push dx
          inc cx
          cmp ax,09
          jg loop1
          push ax
          inc cx
loop2:          pop ax
          mov dl,al
          add dl,30h
          mov ah,02h
          int 21h
          loop loop2
          mov ah,4ch
          int 21h
main endp
end main




