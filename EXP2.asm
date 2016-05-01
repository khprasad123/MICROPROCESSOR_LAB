;EXP 2:
;PROG FOR NO OF 1'S IN FACTORIAL OF A NUMBER
;HARIPRASAD K
;13-01-2016
;ROLL NO:29

.model small
.stack
.data
msg1             db 13,10,"enter the no:","$"
msg2             db 13,10,"answer ","$"
msg3             db 13,10,"no of 1's in the fact :","$"
result             dw 0000h
.code
main             proc
            mov ax,@data
            mov ds,ax
            mov ah,09
            lea dx,msg1
            int 21h
            mov ah,01
            int 21h

            mov ah,09
            lea dx,msg2
            int 21h

            mov ah,00h
            sub al,30h
            cmp al,02
            jle less2
            mov bl,al
            mov bh,00h
            mov cl,al
            sub cl,02
next:            dec bx
            mul bx
            loop next

less2:            mov result,ax
            mov bx,result
            mov ch,bh
            call print8
            mov bx,result
            mov ch,bl
            call print8
            
            mov ax,result
            mov cl,00h
ones:            shr ax,01h
            adc cl,00h
            cmp ax,00h
            jnz ones
            
            mov ah,09
            lea dx,msg3
            int 21h
            mov al,cl
            mov dl,al
            add dl,30h
            mov ah,02
            int 21h
            mov ax,4c00h
            int 21h            
main            endp
            
print8 proc
            mov dl,ch
            and dl,0f0h
            mov cl,04h
            shr dl,cl
            call printa
            mov dl,ch
            and dl,0fh
            call printa
            ret
print8 endp
printa proc
            cmp dl,09h
            jle less
            sub dl,0ah
            add dl,'A'
            jmp prnt
less:            add dl,30h
prnt:            mov ah,02
            int 21h
            ret
printa            endp
end main
            
