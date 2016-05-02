.model small
.stack
disp macro msg
    mov ah,09h
    lea dx,msg
    int 21h
endm
.data
    msg1 db 13,10,"input the string :","$"
    msg2 db " is palindrom","$"
    msg3 db " is not palimdrom","$"
    spacer db "  ","$"
    source db 101 dup(?)
    reverse db 101 dup(?)
    slength db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,source
    lea di,slength
    disp msg1
    call readstring
    call rev
    disp source
    disp spacer
    disp reverse
     lea si,source
     lea di,reverse
    mov cl,slength
    repz cmpsb
    je palin
           disp msg3
           jmp quit               
palin:  disp msg2    
quit:    mov ah,4ch
    int 21h
main endp   
rev proc
    lea si,source
    mov cl,slength
rep1:   mov ax,[si]
    push ax
    inc si
    loop rep1
    mov cl,slength
    lea di,reverse
rep2: pop ax
    mov [di],ax
    inc di
    loop rep2
    mov byte ptr[di],'$'
    ret
rev endp
 
readstring proc
        push ax
        push bx
        push cx
        push dx
        xor dx,dx
read1:  mov ah,01h
        int 21h
        mov [si],al
        inc si
        inc dx
        cmp al,0Dh
        jnz read1
        dec si
        dec dx
next1:  mov byte  ptr[si],'$'
        mov [di],dl
        pop dx
        pop cx
        pop bx
        pop ax
        ret
readstring endp
end  main