;EXP:5
;HARIPRASAD K
;9/02/2016
;ROLL NO 29

.model small
.stack
disply macro msg
      mov ah,09h
      mov dx,offset msg
      int 21h
endm
.data
array dw 12h,19h,8h,4h
count equ 04h
msg1 db 13,10,"initial array: ","$"
msg2 db 13,10,"sorted array: ","$"
.code
main proc
     mov ax,@data
     mov ds,ax
     disply msg1
     call disp
     call sort
     disply msg2
     call disp
     mov ax,4c00h
     int 21h
main endp

sort proc
     mov bl,count
j3:  cmp bl,00h
     je lp
     mov dl,bl
     lea si,array
j2:  mov ax,[si+2]
     cmp [si],ax
     jle j1
     xchg [si],ax
     xchg ax,[si+2]
j1:  inc si
     inc si
     dec dl
     cmp dl,00h
     jne j2
     dec bl
     jmp j3
lp:ret
     
endp sort 

disp proc
	mov cl,count
	lea si,array
lp1:	mov dx,[si]
	mov bl,cl
	mov ch,dl
	call print8b
	mov ah,02h
	mov dl,' '
        int 21h
	add si,02
	mov ch,00h
	mov cl,bl
	loop lp1
	ret
disp endp
print8b proc
	mov dl,ch
	and dl,0f0h
	mov cl,04h
	shr dl,cl
	call printa
	mov dl,ch
	and dl,0fh
	call printa
	ret
print8b endp

printa proc
	cmp dl,09h
	jle less
	add dl,37h
	jmp print
less:   add dl,30h
print:	mov ah,02h
	int 21h
	ret
printa endp
end main