.code
	
pixalize proc
	xor ax,ax
	mov al,8
	mul si
	mov cx,ax

	xor ax,ax
	mov al,4
	mul di
	mov dx,ax
	ret
pixalize endp


shwMap proc
	
	mov di,0
	LP1:
		mov si,0
		LP2:
			mov bx,di
			mov ax,40
			mul bx
			mov bx,ax
			mov al,map[si][bx]
			mov ah,0
			cmp al,0
			je BLANK
			cmp al,1
			je TILE	
			cmp al,2
			je BAR
			cmp al,3
			je BALL
			FIN:
			inc si
			cmp si,40
			jne LP2
		inc di
		cmp di,50
		jne LP1
		jmp EXIT
	
TILE:
	mov [WIN_FLAG],0
	call pixalize
	call drwTile

	jmp FIN
BAR:
	call pixalize
	call drwBar

	jmp FIN
BALL:
	call pixalize
	call drwBall

	jmp FIN

BLANK:
	call pixalize
	call drwBlank

	jmp FIN

EXIT:	
	ret
	
shwMap endp	

drwTile proc
	mov ah,0ch
	mov bl,3
	mov al,2
	inc cx
	inc dx

LP1:
	mov bh,7
	LP2:	
		int 10h
		inc cx
		dec bh
		jnz LP2
	inc dx
	sub cx,7
	dec bl
	jnz LP1

	ret	
drwTile endp

drwBlank proc
	mov ah,0ch
	mov bl,4
	mov al,0

LP1:
	mov bh,8
	LP2:	
		int 10h
		inc cx
		dec bh
		jnz LP2
	inc dx
	sub cx,8
	dec bl
	jnz LP1

	ret	
drwBlank endp

drwBall proc
	mov ah,0ch
	mov al,3
	add cx,2
	mov bl,4
	LP1:
		int 10h
		inc cx
		dec bl
		jnz LP1
	inc dx
	int 10h
	mov bl,5
	LP2:
		dec cx
		int 10h
		dec bl
		jnz LP2
	inc dx
	mov bl,6
	LP3:
		int 10h
		inc cx
		dec bl
		jnz LP3
	sub cx,5
	inc dx
	mov bl,4
	LP4:
		int 10h
		inc cx
		dec bl
		jnz LP4

	
	ret
drwBall endp

drwBar proc
	mov ah,0ch
	mov al,1
	mov bl,2								

LP1:
	mov bh,8
	LP2:	
		int 10h
		inc cx
		dec bh
		jnz LP2
	inc dx
	sub cx,8
	dec bl
	jnz LP1

	ret	
drwBar endp
