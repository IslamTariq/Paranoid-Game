.code
gamewon proc
	mov ah,0
	mov al,4h
	int 10h
	
	mov si,offset WIN
	mov dl,17
again:	
	mov ah,2
	mov dh,12
	
	int 10h
	
	mov ah,9
	mov bl,2
	mov cx,1
	lodsb
	int 10h
	inc dl
	cmp dl,24
	jne again
	
	
again4:	
	mov ah,0
	int 16h
	cmp ah,1h
	jne again4
	
	
	mov ah,4ch
	int 21h


gamewon endp

gameover proc
	mov ah,0
	mov al,4h
	int 10h
	
	mov si,offset OVER
	mov dl,15
again:	
	mov ah,2
	mov dh,12
	
	int 10h
	
	mov ah,9
	mov bl,2
	mov cx,1
	lodsb
	int 10h
	inc dl
	cmp dl,24
	jne again
	
	
again4:	
	mov ah,0
	int 16h
	cmp ah,1h
	jne again4
	
	
	mov ah,4ch
	int 21h

gameover endp

initScreen proc
	mov ah,0
	mov al,4h
	int 10h
	
	mov si,offset intro
	mov dl,15
again:	
	mov ah,2
	mov dh,10
	
	int 10h
	
	mov ah,9
	mov bl,2
	mov cx,1
	lodsb
	int 10h
	inc dl
	cmp dl,23
	jne again
	
	mov si,offset credits
	mov dl,7

again2:	
	mov ah,2
	mov dh,12
	
	int 10h
	
	mov ah,9
	mov bl,2
	mov cx,1
	lodsb
	int 10h
	inc dl
	cmp dl,32
	jne again2
	
	mov si,offset instruct
	mov dl,8
	
	mov bl,2
again3:	
	mov ah,2
	mov dh,24
	
	int 10h
	
	mov ah,9
	mov cx,1
	lodsb
	int 10h
	inc dl
	cmp dl,31
	jne again3	

again4:
	mov ah,0
	int 16h

	cmp ah,39h
	jne again4
	
	mov ah,0
	mov al,4h
	int 10h
	
	mov ah,0bh
	mov bh,1
	mov bl,0
	int 10h

	
	ret
initScreen endp	
