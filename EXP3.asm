;Exp No: 3
;Number of prime numbers in a given list of numbers
;Hariprasad K
;Roll No:29
;29/01/2016

.model small
.stack
.data
arr db 04h,02h,06h,03h,05h,07h,07h
len equ $-arr
count db 00h
msg1 db 13,10,"prime numbers in the list:","$"
msg db 13,10,"number of prime numbers :","$"
.code
main proc
         mov ax,@data
         mov ds,ax

         mov bh,0h
         mov dl,0h
         lea si,arr
         mov ch,len
         lea dx,msg1
         mov ah,09
         int 21h
nexta:         mov bl,[si]
         call prime
         mov dl,count
         add dl,cl
         mov count,dl
         inc si
         dec ch
         jnz nexta
         lea dx,msg
         mov ah,09
         int 21h
         mov dl,count
         add dl,30h
         mov ah,02h
         int 21h
         mov ah,4ch
         int 21h
main endp
prime proc
         mov cl,02h
next:         mov ax,bx
         cmp al,cl
         jz primer
         div cl
         inc cl
         cmp ah,0h
         jnz next
         mov cl,00h
         ret
primer: mov dl,bl
         add dl,30h
         mov ah,02h
         int 21h
         mov cl,01h
         ret
prime endp
end main
