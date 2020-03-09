.code	
delay proc
TIMER:
	mov ah, 0h
	int 1ah
	cmp dx,[WAIT_TIME]
	jb  TIMER
	add dx,1        
	mov [WAIT_TIME],dx
	ret
delay endp
