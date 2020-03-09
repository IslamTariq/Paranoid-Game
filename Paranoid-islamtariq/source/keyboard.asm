.code	
getInput proc	
	mov ah,1		
	
	int 16h
	jz RETURN
	
	
	mov ah,0
	int 16h
	
	cmp ah,1h
	je EXIT
	cmp ah,4dh
	je barRight
	cmp ah,4bh
	je barLeft
	jmp RETURN
	
barRight:
	cmp [barPos],35
	jge RETURN

	mov bx,offset barPos
	mov bx,[bx]
	mov bh,0
	mov [map+40*49+bx],0
	mov [map+40*49+bx+5],2
	inc [barPos]

	jmp RETURN	

barLEFT:	
	cmp [barPos],0
	jle RETURN

	mov bx,offset barPos
	mov bx,[bx]
	mov bh,0
	mov [map+40*49+bx-1],2
	mov [map+40*49+bx+4],0
	dec [barPos]
	
	jmp RETURN	

RETURN:
	mov ah,0ch
	int 21h
	
	ret
	
EXIT:	
	mov ah,4ch
	int 21h
getInput endp
