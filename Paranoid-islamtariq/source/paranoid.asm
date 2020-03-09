.model small
.stack 100h
.data
map	db 1 dup(40 dup(0))
	db 13 dup(40 dup(1))
	db 25 dup(40 dup(0))
	db 9 dup(40 dup(0))
	db 16 dup(0),3,24 dup(0)
	db 14 dup(0),2,2,2,2,2,21 dup(0)

barPos db 15
ballPosX dw 16 
ballPosY dw 48
intro db "PARANOID"
credits db " CREATED BY: ISLAM TARIQ "
instruct db "PRESS SPACE TO CONTINUE"
WIN db "YOU WON"
OVER db "GAME OVER"
ball_dx dw 1
ball_dy dw -1
GAMEOVER_FLAG dw 0
WIN_FLAG dw 1	
WAIT_TIME dw ?

include collisions.asm
include time.asm
include keyboard.asm
include motion.asm
include mapping.asm
include pages.asm

.code
main proc

	mov ax,@data
	mov ds,ax

	call initScreen
	
MAINLOOP:
	mov [WIN_FLAG],1
	call shwMap
	call mvBall

	cmp [GAMEOVER_FLAG],1
	je GAMEOVR
	
	cmp [WIN_FLAG],1
	je GAMEWN
	
	
	call detectBoundaries
	call detectCollision
	call getInput
	call delay
	jmp MAINLOOP
		
	GAMEOVR:
		call gameover
	GAMEWN:
		call gamewon

main endp
	
end main
	                                                                                                                                                                                                                                                                   
