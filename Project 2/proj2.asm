.MODEL large
.386
.STACK 256

; Declare all the variables in this section
.DATA

vBuff db 64200 dup(0); fixed graphic glitch
tempVar dw 0

;Variables defined for the initial screen 
msg1 DB "		        							    	        $"
msg2 DB "	         --------	 ---------	  -	    	    $"
msg3 DB "	        | -------|	 | _____ |	 | |      	$"
msg4 DB "	        | |	         | |   | |	 | |      	$"
msg5 DB "	        | |   _______	 | |   | |	 | |      	$"
msg6 DB "	        | |   |_ | | |   | |   | |	 | |      	$"
msg7 DB " 	        | |____| | | |   | |___| |       | |_______   $"
msg8 DB "	        |________| |_|   |_______|       |_________|  $"
msg9 DB "				        					    	        $"
msg10 DB "		          WELCOME TO GAME OF LIFE					$"
msg11 DB "						        			    	        $"
msg12 DB "		        PRESS ENTER TO START THE GAME				$"
msg13 DB "					        				    	        $"
msg14 DB "                        SUBMITTED BY : ANAM MUNAWAR	    $"

;variables  defined for exit screen
emsg1 DB "									      $"
emsg2 DB "	   --------	   		---------	      $"
emsg3 DB "	  | -------|	   		| _____ |	  $"
emsg4 DB "	  | |	           		| |   | |	  $"
emsg5 DB "	  | |   _______	   		| |   | |	  $"
emsg6 DB "	  | |   |_ | | |   		| |   | |	  $"
emsg7 DB " 	  | |____| | | |   		| |___| | 	  $"
emsg8 DB "	  |________| |_|AME   		|_______|VER  $"
emsg9 DB "									    	  $"
emsg10 DB "		       SEE YOU NEXT TIME				  $"
emsg11 DB "									    	      $"
emsg12 DB "		       PRESS ESC TO EXIT				  $"
emsg13 DB "									    	      $"
emsg14 DB "		       PRESS SPACE TO RESET			      $"


.CODE

MAIN PROC FAR

    call initialize

	restart:
    call startVgaMode

   ; To make sure that everything works properly, clear the video buuffer and the video memory
   
    mov BX, 0h; setting the counter equal to zero
       call bufferCleared
       call initialScreenSetup


    programCodeLoop:
        call nextGen
            mov ah,00
            int 16h
            cmp al,1bh 
            je QUIT
			cmp al, 20h
			je restart
        jmp programCodeLoop

    ; Go to the exitpage and quit the VGA mode

        QUIT:
        call exitpage
        call quitVgaMode

MAIN ENDP

initialize proc near
    ;DATA segment being initialized
        mov AX, @DATA
        mov DS, AX
        call titlePage

    ;ES being initialzied
        mov AX, 0A000h
        mov ES, AX

    ;All general purpose registers are being cleared
        xor AX, AX
        xor BX, BX
        xor CX, CX
        xor DX, DX
 ret
 initialize ENDP

;Display the title page
titlePage proc near 
    mov AX, 012h
    int 10h
 
	mov dx, offset msg1
	mov ah, 9
	int 21h
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg2
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg3
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg4
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg5
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg6
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg7
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg8
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg9
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg10
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg11
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg12
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg13
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset msg14
	mov ah,9
	int 21h 
	
	mov ah, 0h
	int 16h

    ret
titlePage ENDP

startVgaMode proc near
    mov AX, 013h
    int 010h
ret
startVgaMode ENDP

bufferCleared proc near
        mov byte ptr vBuff[BX], 0h
        mov byte ptr ES:[BX], 0h      
        add BX,1                      ; counter += 1
        cmp BX, 0FA01h
        jne bufferCleared
ret
bufferCleared ENDP


; setting up the initial ocnfiguration
initialScreenSetup proc near
mov al, 13h
mov ah, 0   ; setting graphics video mode.
int 10h   
mov ax, 1   ; will display the mouse
int 33h
nextPosition:
mov ax, 3   ; get cursor positon in cx,dx
int 33h

mov ah, 0ch 
mov al,06h  ; color = 06h (throughout the code/program)
mov bh,0   
shr cx,1    ; cx will be double
int 10h    
cmp bx,2
jz nextGen
jmp nextPosition

mov ah,4ch
int 21h
ret
initialScreenSetup ENDP

nextGen proc near
    ; Saving the stack
        push AX
        push CX
        push DX
        push BX  
        push DI
        push DS

	    mov AX, 2
		int 33h

    ; Initializing counters in DX (x-position), CX (y-position) and DI
        mov CX, 0h             ; initial_y_value = 0
        mov DI, 0h             ; 320(y) + x
        mov AX, offset vBuff   ; base address of video buffer (vBuff) is being loaded into AX
        mov DX, DS
        add AX, DX
        mov DS, AX             ; Now, base address of video buffer (vBuff) is in DS

    rowLoop:                   ; increment y-position
        mov DX, 0h             ; initial_x_value = 0
        add CX,1               ; y += 1
        cmp CX, 0c7h           ; checking if y-value has reached it's maximum
        jne columnLoop         ; if y-value is not at max, continue iterating
        jmp endNextGen

        columnLoop:           ; increment x-postion 
            add DX,1          ; x += 1
            cmp DX, 13Fh      ; is x at max
            je rowLoop        ; if x at max, go to outer loop
            mov BX, CX        ; BX = y
            sub BX,1            
            mov AX, 0140h; 
            mov tempVar, DX   
            mul BX            ;THIS WILL MAKE DX = 0
            mov DX,tempVar
            mov BX, DX        ; BX = x
            sub BX,1           
            add AX, BX
            mov DI, AX
			
			;Checking neighbours
            mov AX, 0h        ; stores live pixels around x,y

            upperLeftNeighbor:
                cmp byte ptr ES:[DI], 0h  ; checking if current screen memory == 1 at x-1, y-1
                jz upperMiddleNeighbor
                add AX, 1                 ; increase AX by 1, if upperMiddleNeighbor !=0

            upperMiddleNeighbor:
                add DI,1                  
                cmp byte ptr ES:[DI], 0h  ; checking if current screen memory == 1 at x, y-1
                jz upperRightNeighbor
                add AX,1                  ; increase AX by 1, if upperRightNeighbor !=0

            upperRightNeighbor:
                add DI, 1                 
                cmp byte ptr ES:[DI], 0h  ;checking if current screen memory == 1 at x+1,y-1
                jz middleRightNeighbor
                add AX,1                  ; increase AX by 1, if middleRightNeighbor !=0

            middleRightNeighbor:
                add DI, 0140h             
                cmp byte ptr ES:[DI], 0h  ; checking if current screen memory == 1 at x+1,y
                jz middleLeftNeighbor
                add AX,1                  ; increase AX by 1, if middleLeftNeighbor !=0

            middleLeftNeighbor:
                sub DI,2                  
                cmp byte ptr ES:[DI], 0h  ; checking if current screen memory == 1 at x-1,y
                jz lowerLeftNeighbor
                add AX,1                  ; increase AX by 1, if  lowerLeftNeighbor !=0

            lowerLeftNeighbor:
                add DI, 0320d             
                cmp byte ptr ES:[DI], 0h  ; checking if current screen memory == 1 at x-1,y+1
                jz lowerMiddleNeighbor
                add AX, 1                 ; increase AX by 1, if  lowerMiddleNeighbor !=0

            lowerMiddleNeighbor:
                add DI, 1                 
                cmp byte ptr ES:[DI], 0h  ; checking if current screen memory == 1 at x,y+1
                jz lowerRightNeighbor
                add AX,1                  ; increase AX by 1, if  lowerRightNeighbor !=0

            lowerRightNeighbor:
                add DI, 1                 
                cmp byte ptr ES:[DI], 0h  ; checking if current screen memory == 1 at x+1,y-1
                jz checkPixel
                add AX, 1                 ; if not zero increase AX by 1

            checkPixel:
                sub DI, 0140h
                sub DI,1
                cmp byte ptr ES:[DI], 0h   ; checking if current cell is alive
                jz cellDead?               

                cellDead?:
                    cmp AX, 03h
                    je cellAliveAgain
                    jmp columnLoop

                cellKilled:
                    mov byte ptr DS:[DI], 0h
                    jmp columnLoop

                cellAliveAgain:
                    mov byte ptr DS:[DI],06h
                    jmp columnLoop
                    
                ; Checking if teh cell is living
                cellLiving?:
                    cmp AX, 00d; Rule 1
                    je cellKilled; jump if less than 2
                    cmp ax, 1h
                    je cellKilled
                    cmp ax,2h
                    je cellAliveAgain
                    cmp ax,3
                    je cellAliveAgain
                    jmp cellKilled					

 call endNextGen
    
ret 
nextGen ENDP

fromBuffToScr proc near

    push CX
    push DI
    push SI
    mov DI, 0h
    mov SI, 0h
    mov CX, 0FA00h 
    cld            ; clearing the direction flag 
    rep MOVSB	   ; From your notes
    pop SI
    pop DI
    pop CX

ret
fromBuffToScr ENDP

endNextGen proc near
    call fromBuffToScr
; Getting the stack back
    pop DS
    pop DI
    pop BX
    pop DX
    pop CX
    pop AX
ret
endNextGen ENDP

;Load the exitpage when you hit Esc key
exitpage proc near

    mov AX, 012h
    int 10h

	mov dx, offset emsg1
	mov ah, 9
	int 21h
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg2
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg3
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg4
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg5
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg6
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg7
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg8
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg9
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg10
	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg11

	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg12

	mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg13
    mov ah,9
	int 21h 
	
	mov dx, 10
	mov ah, 2
	int 21h
	 
	mov dx,13
	mov ah,2
	int 21h
	 
	mov dx, offset emsg14

	mov ah,9
	int 21h 

	mov ax, 0
	int 16h 
	cmp al, 20h
	jz restart
	cmp al, 1bh
	jz byebye

byebye:
	mov ax, 3
	int 10h
		
	mov ah, 4ch
	int 21h
ret
exitpage endp

quitVgaMode proc near
    mov AX, 03h
    int 10h

    mov ax, 4c00h ;exit command
    int 21h;

quitVgaMode ENDP

END