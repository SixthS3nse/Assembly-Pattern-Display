.model small
.stack 100h

.data
    banner  db 42,45,45,45,45,45,45,45,45,45,45,45,45,45,45, 'Banner' ,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,42,13,10
            db 42,32,32,32, 'Welcome to APU Music Fest' ,32,32,32,32,32,32,32,32,32,32,42,13,10
            db 42,32,32,32, 'Technology Part Malaysia' ,32,32,32,32,32,32,32,32,32,32,32,42,13,10
            db 42,32,32,32, 'Organized by APU Event Management' ,32,32,42,13,10
            db 42,32,32,32, 'DJ Dexter | DJ YAY' ,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
            db 42,32,32,32, 'Date: 10/06/2022' ,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
            db 42,32,32,32, 'Time: 8PM - 10PM' ,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
            db 42,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,42,13,10

    menu db 42,45,45,45,45,45,45,45,45,45,45,45,45,45, 'Main Menu' ,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,42,13,10
         db 42,32, '1). Number Patterns' ,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
         db 42,32, '2). Design Patterns' ,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
         db 42,32, '3). Box Type Patterns' ,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
         db 42,32, '4). Nested Loop Patterns' ,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
         db 42,32, '5). Exit' ,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,42,13,10
         db 42,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,42,13,10
         db 'Enter Choice : $'
         
    input db ""
    
    printNumber db "Shape in Numbers Patterns Generated.", 13, 10, "$"
    printDesign db "Shape in Design Patterns Generated.", 13, 10, "$"
    printBoxType db "Shape in Box Type Patterns Generated.", 13, 10, "$"
    printNestedLoop db "Shape in Nested Loop Patterns Generated.", 13, 10, "$" 
    printInvalidOption db "Invalid Option!", 13, 10, "$"

STAR DB '?'
BLANK DB '?'

.code

Main proc

begin:    
    ;fetch from predefined data
    mov ax, @data
    mov ds, ax
    
    ;print menu
    mov ah, 09h
    mov dx, offset banner 
    int 21h
    
    ;get menu option
    mov ah, 01h
    int 21h
    
    ;menu navigations
    cmp al, '1'
    je func_Num
    
    cmp al, '2'
    je func_Des
    
    cmp al, '3'
    je func_Box
    
    cmp al, '4'
    je func_Nested
    
    cmp al, '5'
    je exit
    
    ;jump to invalid option
    jmp func_IO
    
func_Num:  

    ;print number patterns
    ;Top Triangle  
    mov ah,2
    mov cx,10
  
    mov dl,10 
    int 21h 
    mov dl,13
    int 21h
    
    MOV CX,9
    MOV BX,1
    
   NL1:
    PUSH CX
       
   NL2:
    MOV AH,2
    MOV DL,32
    INT 21H
    LOOP NL2   
    
    MOV CX,BX
   NL3:
    MOV AH,2
    MOV DL,48 ;print with "0"
    INT 21H
    LOOP NL3
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    INC BX
    INC BX
    
    POP CX
    LOOP NL1
    
   ;---------------------------------  
   ; Bottom Triangle
    
    MOV CX,8 ;Num of lines printed 
    MOV BH,15 ; Initial count
    MOV BL,2 ; Initial Spacing
    
    MOV STAR,BH
    MOV BLANK,BL
    
   NL4:
    CMP BLANK,0
    JE NL5
    MOV AH,2
    MOV DL,32
    INT 21H
    DEC BLANK
    JMP NL4
    
   NL5:
    MOV AH,2
    MOV DL,48  ;print with "0"
    INT 21H
    DEC STAR
    CMP STAR,0
    JNE NL5
   NL6:  
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    DEC BH
    DEC BH
    MOV STAR,BH
    
    INC BL
    MOV BLANK,BL
    
    LOOP NL4

    ;-New Line-
    mov dl, 10
    mov ah, 02h
    int 21h
    
    ;-Prompt Successful Message-
    mov ah,09h ; char display function
    mov dx, offset printNumber ; printNumber is displayed
    mov bh,0 ; start value of char, start should be always 0
    mov bl,6 ; color combination. upto 255 
    mov cx,39 ; cx - counter reg to repeat the char display (Char Count)
    int 10h
    
    jmp print
    
func_Des:
  ;print design patterns
  mov cx,5
  mov ah,2
  
  ;new line
  mov dl,10 
  int 21h
  
  mov dl,0dh
  int 21h

  DL1: ;line 1
      mov dl,32
      int 21h
      int 21h
      int 21h
      int 21h
      int 21h
      int 21h
    
      mov dl,42
      int 21h
      int 21h

  loop DL1

  mov dl,10
  int 21h
  mov dl,0dh
  int 21h

  mov cx,5

  mov dl,32
  int 21h

  DL2: ;line 2
      mov dl,32
      int 21h
      int 21h
      int 21h
      int 21h
    
      mov dl,42
      int 21h
    
      mov dl,32
      int 21h
      int 21h
      mov dl,42
      int 21h


  loop DL2

  mov dl,10
  int 21h
  mov dl,0dh
  int 21h

  mov cx,5
  mov dl,32
  int 21h
  int 21h

  DL3: ;line 3
      mov dl,32
    
      int 21h
      int 21h
      
      mov dl,42
      int 21h
    
      mov dl,32
      int 21h
      int 21h
      int 21h
      int 21h
    
      mov dl,42
      int 21h


  loop DL3

  mov dl,10
  int 21h
  mov dl,0dh
  int 21h
  mov cx,5

  mov dl,32
  int 21h
  int 21h
  int 21h

  DL4: ;line 4

      mov dl,42
      int 21h
    
      mov dl,32
      int 21h
      int 21h
      int 21h
      int 21h
      int 21h
      int 21h
    
      mov dl,42
      int 21h


  loop DL4

  mov dl,10
  int 21h
  mov dl,0dh
  int 21h
  mov cx,5

  mov dl,32
  int 21h
  int 21h

  DL5: ;line 5
      mov dl,32
      int 21h
      int 21h
    
      mov dl,42
      int 21h
    
      mov dl,32
      int 21h
      int 21h
      int 21h
      int 21h
      mov dl,42
      int 21h


  loop DL5

  mov dl,10
  int 21h
  mov dl,0dh
  int 21h
  mov cx,5

  mov dl,32
  int 21h
 
  DL6: ;line 6
      mov dl,32
      int 21h
      int 21h
      int 21h
      int 21h
    
      mov dl,42
      int 21h
    
      mov dl,32
      int 21h
      int 21h
      mov dl,42
      int 21h


  loop DL6

  mov dl,10
  int 21h
  mov dl,0dh
  int 21h
  mov cx,5

  DL7: ;line 7
      mov dl,32
      int 21h
      int 21h
      int 21h
      int 21h
      int 21h
      int 21h
      mov dl,42
      int 21h
      int 21h

  loop DL7

  mov dl,10
  int 21h
  int 21h
  mov dl,0dh
  int 21h                 
                 
    ;-New Line-
    mov dl, 10
    mov ah, 02h
    int 21h
    
    ;-Prompt Successful Message-
    mov ah,09h ; char display function
    mov dx, offset printDesign ; printDesign is displayed
    mov bh,0 ; start value of char, start should be always 0
    mov bl,6 ; color combination. upto 255 
    mov cx,39 ; cx - counter reg to repeat the char display (Char Count)
    int 10h
    
    jmp print
    
func_Box:
    ;print box type patterns
    mov ah,2
    mov cx,10
  
    mov dl,10 
    int 21h 
    mov dl,13
    int 21h
    
    
    BL1:
    PUSH CX
    MOV CX,10
       
    BL2:
     MOV AH,2
     MOV DL,42 ;print with "*"
     INT 21H
       
     LOOP BL2
     
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
     
     
    POP CX     

       LOOP BL1

    ;-New Line-
    mov dl, 10
    mov ah, 02h
    int 21h
    
    ;-Prompt Successful Message-
    mov ah,09h ; char display function
    mov dx, offset printBoxType ; printBoxType is displayed
    mov bh,0 ; start value of char, start should be always 0
    mov bl,6 ; color combination. upto 255 
    mov cx,39 ; cx - counter reg to repeat the char display (Char Count)
    int 10h
    
    jmp print
        
func_Nested:
    ;print nested loop patterns
    mov ah,2
    mov bl,10 ;num of rows
    mov cl,0 ;loop index, always start with 0
    mov ch,1; top star initial value
    mov bh,5; bot star initial value

    mov dl,10 
    int 21h
    int 21h 
    mov dl,13
    int 21h

  NLL1:
    inc cl
    mov dl,42
    int 21h

    cmp cl,ch
    jne NLL1

    mov dl,09
    int 21h
    mov cl,0

  NLR1:
    inc cl
    mov dl,42
    int 21h

    cmp cl,bh
    jne NLR1

    mov dl,10 
    int 21h
    mov dl,13
    int 21h

    mov cl,0
    inc ch
    dec bh
    dec bl
    cmp bl,5
    jne NLL1
  
    mov cl,0
    mov ch,1
    mov bh,5
    mov dl,10
    int 21h

  NLL2:
    inc cl
    mov dl,42
    int 21h

    cmp cl,ch
    jne NLL2

    mov dl,09
    int 21h
    mov cl,0

 NLR2:
    inc cl
    mov dl,42
    int 21h

    cmp cl,bh
    jne NLR2

    mov dl,10
    int 21h
    mov dl,13
    int 21h
   
    mov cl,0
    inc ch
    dec bh
    dec bl
    cmp bl,0
    jne NLL2
    mov cl,0
    mov ch,1
  
    mov dl,10 
    int 21h
    mov dl,13
    int 21h
    
    ;-New Line-
    mov dl, 10
    mov ah, 02h
    int 21h
    
    ;-Prompt Successful Message-
    mov ah,09h ; char display function
    mov dx, offset printNestedLoop ; printNestedLoop is displayed
    mov bh,0 ; start value of char, start should be always 0
    mov bl,6 ; color combination. upto 255 
    mov cx,39 ; cx - counter reg to repeat the char display (Char Count)
    int 10h
    
    jmp print
    
func_IO:
    ;print invalid menu option
    
    ;-New Line-
    mov dl, 10
    mov ah, 02h
    int 21h
    
    ;-Prompt Successful Message-
    mov ah,09h ; char display function
    mov dx, offset printInvalidOption ; printInvalidOption is displayed
    mov bh,0 ; start value of char, start should be always 0
    mov bl,6 ; color combination. upto 255 
    mov cx,39 ; cx - counter reg to repeat the char display (Char Count)
    int 10h
    
    jmp print
    
print:
    ;print patterns 
    int 21h
    jmp begin
    


exit:

    mov ah,4ch
    int 21h
    
Main endp
end main