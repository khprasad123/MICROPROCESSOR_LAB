;EXP4:SUBSTRING SEARCH
;HARIPRASAD K
;9/02/2016
;ROLL NO:29

.model small
.stack
disply macro msg
      mov ah,09h
      mov dx,offset msg
      int 21h
endm
.data
maxsize     db     100
msg4     db     "input the string :","$"
msg1     db     "input the string to search:","$"
msg2     db     " is a substring of ","$"
msg3     db     " is not a substring of ","$"
source     db     101 dup (?)
key     db     101 dup(?)
slength     db     ?
klength     db     ?
.code
main      proc
     mov ax,@data
     mov ds,ax
     mov es,ax

          disply msg4
     lea si,source
     lea di,slength
     call readstring

     disply msg1
     lea si,key
     lea di,klength
     call readstring

     disply key

     mov ah,slength
     mov al,klength
     cmp ah,klength
     jl notsubstring
check:     lea si,source[bx]
     inc bx
     lea di,key
     xor ch,ch
     mov cl,klength
     repz cmpsb
     je substring
     mov dl,slength
     sub dl,bl
     cmp dl,klength
     jge check
     jmp notsubstring

substring:disply msg2
       jmp quit
notsubstring:disply msg3
quit:     disply source
     mov ah,4ch
     int 21h     
readstring     proc
     push ax
     push bx
     push cx
     push dx

     xor ch,ch
     xor dx,dx
     mov cl,maxsize
     
reads:     mov ah,01
     int 21h
     mov [si],al
     inc si
     inc dx
     cmp al,0Dh; checking for a new line
     jnz reads
     dec si
     dec dx
     cmp byte ptr[si],0Dh
     jz next1
     inc si
     inc dx
next1:     mov byte ptr[si],'$'
     mov [di],dl
     pop dx
     pop cx
     pop bx
     pop ax     
     ret
readstring     endp

main     endp
end      main

     