.code

detectBoundaries proc
	cmp [ballPosX],39
	je NEGX
	cmp [ballPosX],0
	je NEGX
C2:	cmp [ballPosY],0
	je NEGY

	cmp [ballPosY],48
	je BOTTOM
E:	
	ret

NEGX:	
	NEG [ball_dx]
	jmp C2

NEGY:	
	NEG [ball_dy]
	jmp E

BOTTOM:
	cmp [map+bx+si+40],2
	je NEGY
	
	cmp [ball_dx],1
	je N41
	jne N39
	N41: 
		cmp [map+bx+si+41],2	
		je NEGB
	N39:
		cmp [map+bx+si+39],2
		je NEGB
		
	
	mov GAMEOVER_FLAG,1
	jmp E
	
NEGB:
	NEG [ball_dy]
	NEG [ball_dx]
	jmp E
	

detectBoundaries endp	


detectCollision proc
		cmp [ballPosY],0
		je C1
		cmp [map+bx+si-40],1
		je UP
	
	C1:
		cmp [map+bx+si+40],1
		je BOTM
	C2:
		cmp [ballPosX],39
		je C3
		cmp [map+bx+si+1],1
		je RIGT
	C3:
		cmp [ballPosX],0
		je C4
		cmp [map+bx+si-1],1
		je LFT
	

	C4:
		cmp [ballPosX],39
		je C5
		cmp [map+bx+si+41],1
		je BRT	
	C5:
		cmp [ballPosX],0
		je C6
		cmp [map+bx+si+39],1
		je BLT
	C6:
		cmp [ballPosX],0
		je C7
		cmp [ballPosY],0
		je C7
		cmp [map+bx+si-41],1
		je ULT
	C7:
		cmp [ballPosY],0
		je C8
		cmp [ballPosX],39
		je C8
		cmp [map+bx+si-39],1
		je URT
	C8:
		ret
URT:
	mov [map+bx+si-39],0
	NEG [ball_dy]
	jmp C8
ULT:
	mov [map+bx+si-41],0
	NEG [ball_dy]
	jmp C8
BLT:
	mov [map+bx+si+39],0
	NEG [ball_dy]
	jmp C8
		
BRT:
	mov [map+bx+si+41],0
	NEG [ball_dy]
	jmp C8
		
LFT:
	mov [map+bx+si-1],0
	NEG [ball_dx]
	jmp C8

RIGT:
	mov [map+bx+si+1],0
	NEG [ball_dx]
	jmp C8
BOTM:
	mov [map+bx+si+40],0
	NEG [ball_dy]
	jmp C8
UP:
	mov [map+bx+si-40],0
	NEG [ball_dy]
	jmp C8
	
	ret
detectCollision endp
