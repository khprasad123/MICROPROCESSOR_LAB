;EXP1: 32 BIT ADDITION 
; HARIPRASAD K
;S6-R 29
;13/1/16

.model small
.stack
.data
        n1	dw 1234h
	n2	dw 5555h
	n3	dw 6789h
        n4	dw 1111h
	ans1	dw 0000h
	ans2	dw 0000h
.code
main 	proc
	mov ax,@data
	mov ds,ax
	mov bx,n2
	add bx,n4
	mov ans1,bx
	mov cx,n1
	adc cx,n3
	mov ans2,cx


	mov bx,ans2
	mov ch,bh
	call print8
	mov bx,ans2
	mov ch,bl
	call print8
	mov bx,ans1
	mov ch,bh
	call print8
	mov bx,ans1
	mov ch,bl
	call print8

	

	mov ax,4c00h
	int 21h
main	endp
print8	proc
	mov dl,ch
	and dl,0f0h
	mov cl,04h
	shr dl,cl
	call printa
	mov dl,ch
	and dl,0fh
	call printa
	ret
	

print8	endp

printa	proc
	cmp dl,09h
	jle less
	sub dl,0ah
	add dl,'A'
	jmp prnt
less:	add dl,30h
prnt:	mov ah,02
	int 21h
	ret
printa	endp
end main
	