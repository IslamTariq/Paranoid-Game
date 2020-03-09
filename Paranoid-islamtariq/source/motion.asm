.code
mvBall proc
	mov bx,offset ballPosX
	mov si,offset ballPosY
	mov bx,[bx]
	mov si,[si]
	xor ax,ax
	mov al,40
	mul si
	mov si,ax
	mov [map+bx+si],0

	mov di,offset ball_dx
	mov ax,[di]
	add [ballPosX],ax
;	cmp [ballPosX],ax
	mov di,offset ball_dy
	mov ax,[di]
	add [ballPosY],ax
;	cmp [ballPosY],ax
	
	mov bx,offset ballPosX
	mov si,offset ballPosY
	mov bx,[bx]
	mov si,[si]
	xor ax,ax
	mov al,40
	mul si
	mov si,ax
	mov [map+bx+si],3

	ret
	
mvBall endp
