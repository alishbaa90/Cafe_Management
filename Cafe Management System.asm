.model large 
print macro m 
    mov ah, 09 
    lea dx, m 
    int 21h 
endm 
 
.stack 100h 
.data 
M1 DB 10,13,10,13,'                             Welcome to Cafe Lola =D                                   $'   
ST DB 10,13,10,13,'           Cafe owned by three girls, different personalities under one roof $'   
M2 DB 10,13,10,13,'Would you like to have:  $' 
 
M3 DB 10,13,'                  1.Brunch         $'  
M4 DB 10,13,'                  2.Hi-Tea            $' 
M5 DB 10,13,'                  3.Buffet           $'   
 
str db 10,13,'3.Continue with the same menu.       $'                
                
M8 DB 10,13,10,13,'Enter the number associated with the dish you would like to have: $'  
M6 DB 10,13,10,13,'Enter the number associated with the age group you prefer to get buffet for: $' 
   
;BRUNCH 
M9 DB 10,13,'            1.Creme Brulee French Toast          Rs 10                     $'  
M10 DB 10,13,'            2.Choco Cinnamon Rolls (3 pieces)    Rs 10                     $' 
M11 DB 10,13,'            3.Quiche                             Rs 10                     $' 
M12 DB 10,13,'            4.Acai Bowl                          Rs 10                     $' 
M13 DB 10,13,'            5.Granola Bowl with choice of fruits Rs 20                     $'      
M14 DB 10,13,'            6.Crossiant Sandwiches               Rs 20                     $' 
M15 DB 10,13,'            7.Assorted Bread Basket with drink   Rs 10                     $' 
M16 DB 10,13,'            8.Seasonal Fruit Smoothies           Rs 20                     $' 
M17 DB 10,13,'            9.Coffee                             Rs 60                     $'  
 
;Hi-Tea 
 
M25 DB 10,13,'   1.Dynamit Shrimps   (6 pieces)          Rs 90                $'  
M26 DB 10,13,'   2.Korean Fried Chicken (4 pieces)       Rs 90                $'  
M27 DB 10,13,'   3.Dumplings  (6 pieces)                 Rs 30                $'  
M28 DB 10,13,'   4.Beijing Chicken Drummets (4 pieces)   Rs 90                $' 
M29 DB 10,13,'   5.Choco loco Mousse                     Rs 90                $' 
M30 DB 10,13,'   6.Tea                                   Rs 10                $' 
M31 DB 10,13,'   7.Pudding with Fresh Fruits             Rs 30                $' 
M32 DB 10,13,'   8.Coffee                                Rs 30                $' 
M33 DB 10,13,'   9.Chiller                               Rs 30                $'       
 
;Buffet 
M34 DB 10,13,'   1.Kids  (under 10years old)            Rs 30                $' 
M35 DB 10,13,'   2.Students (above 10 but under 20)     Rs 60                $'       
M36 DB 10,13,'   3.Adults                               Rs 90                $'      
M37 DB 10,13,'   4.Senior Citizens                      Rs 80                $' 
 
;INVALID 
M55 DB 10,13,10,13,'  INVALID option selected $' 
M56 DB 10,13,'      Try Again $' 
 
M57 DB 10,13,10,13,'Enter the number associated with the dish you would like to have: $' 
M58 DB 10,13,'Quantity: $' 
M59 DB 10,13,'Total Bill:RS $' 
 
QUANTITY DB ? 
price db ? 
 
M60 DB 10,13,10,13,'1.Go Back to Main Menu$' 
M61 DB 10,13,'2.EXIT$'   
 
M62 DB 10,13,'   Due to a lot of customers at the moment sorry u can only order two things for now.               $' 
 
SEJ DB 10,13,10,13,' $' 
 
.code 
MAIN PROC 
    MOV AX,@DATA 
    MOV DS,AX 
  TOP: 
    print M1 
    print ST 
    print SEJ ;NEWLINE 
    
    mov price,'0' 
      
    print M3   ; brunch 
    print M4 
    print M5 
     
    print M2 ; choice 
     
    MOV AH,1    ; input 
    INT 21H 
    MOV BH,AL 
    SUB BH,48 
     
    CMP BH,1 
    JE BRUNCH 
     
    CMP BH,2 
    JE HiTea 
     
    CMP BH,3 
    JE BUFFET    
    JMP INVALID 
     
   BRUNCH:   ;BRUNCH STARTS 
     
    LEA DX,SEJ ;NEWLINE 
    MOV AH,9 
    INT 21H 
       
    print M9 
    print M10 
    print M11 
    print M12 
    print M13 
    print M14 
    print M15 
    print M16 
    print M17 
    print M57 
     
    MOV AH,1 
    INT 21H 
    MOV BL,AL 
    SUB BL,48  
     
    CMP BL,1 
    JE TEN 
     
    CMP BL,2 
    JE TEN 
     
    CMP BL,3 
    JE TEN  
     
    CMP BL,4 
    JE TEN 
     
    CMP BL,5 
    JE TWENTY 
     
    CMP BL,6 
    JE TWENTY 
     
    CMP BL,7 
    JE TEN 
     
    CMP BL,8 
    JE TWENTY  
     
    CMP BL,9 
    JE SIXTY 
 
    JMP INVALID 
     
   FOURTY: 
    MOV BL,4 
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
 
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H 
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
     
    ;GO BACK TO MAIN MENU 
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H 
     
    lea Dx,str 
    mov ah,09    ;for going same menu 
    int 21h  
     
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H             ;MAIN MENU 
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
     
     
    CMP AL,1 
    JE TOP 
    cmp Al,2 
    JE BRUNCH 
    JMP EXIT 
              
   FIFTY: 
    MOV BL,4 
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
      
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H  
     
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
            
            
    ;GO BACK TO MAIN MENU 
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48    ;MAIN  MENU 
     
    CMP AL,1 
    JE TOP 
     
    JMP EXIT 
              
   SEVENTY: 
    MOV BL,7 
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
      
     
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H  
     
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
     
    ;GO BACK TO MAIN MENU  
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H       ;MAIN MENU 
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
     
    CMP AL,1 
    JE TOP 
     
    JMP EXIT 
          
   EIGHTY: 
    MOV BL,8 
    LEA DX,M58               
    MOV AH,9 
    INT 21H 
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
      
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H 
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
     
    ;GO BACK TO MAIN MENU 
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M2    ;MAIN MENU 
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
          
    CMP AL,1 
    JE TOP 
    JMP EXIT          
    JMP EXIT  
     
     HiTea: 
                    ;Hi-Tea 
     
    LEA DX,SEJ ;NEWLINE 
    MOV AH,9 
    INT 21H 
      
    print M25 
    print M26 
    print M27 
    print M28 
    print M29 
    print M30 
    print M31 
    print M32 
    print M33 
    print M57  
     
     
    MOV AH,1 
    INT 21H 
    MOV BL,AL 
    SUB BL,48  
     
    CMP BL,1 
    JE NINETY 
     
    CMP BL,2 
    JE NINETY 
     
    CMP BL,3 
    JE THIRTY 
     
    CMP BL,4 
    JE NINETY 
     
    CMP BL,5 
    JE NINETY 
     
    CMP BL,6 
    JE TEN 
     
    CMP BL,7 
    JE THIRTY 
     
    CMP BL,8 
    JE THIRTY  
     
    CMP BL,9 
    JE THIRTY 
     
    JMP INVALID 
     
   TEN: 
    MOV BL,1 
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
      
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
    print M59               
   
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H   
     
    ;FOR /- PRINT 
     
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
      
    ;GO BACK TO MAIN MENU  
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H 
     
    lea dx,str 
    mov ah,09 
    int 21h  
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H  
     
     
    MOV AH,1 
    INT 21H           
    SUB AL,48 
     
    CMP AL,1 
    JE TOP 
    cmp Al,3 
    JE BRUNCH 
    JMP EXIT 
     
   TWENTY: 
    MOV BL,2 
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H 
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
     
    ;GO BACK TO MAIN MENU 
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H    
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
     
    CMP AL,1 
    JE TOP 
    JMP EXIT  
     
   THIRTY: 
    MOV BL,3 
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
 
    MOV AH,1 
    INT 21H 
    SUB AL,48 
      
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H   
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
     
    ;GO BACK TO MAIN MENU 
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H    
        
    lea dx,str 
    mov ah,09 
    int 21h  
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
    CMP AL,1 
    JE TOP 
    cmp al,3 
    je HiTea 
    JMP EXIT 
     
   SIXTY:  
    
    MOV BL,6 
    
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
      
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
     
     
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H  
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H 
     
    ;GO BACK TO MAIN MENU  
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H             ;MAIN MENU 
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H  
 
    lea dx,str 
    mov ah,09 
    int 21h  
            
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
    CMP AL,1 
    JE TOP 
    cmp al,3 
    je HiTea 
    JMP EXIT 
 
   NINETY: 
    MOV BL,9 
     
    LEA DX,M58               
    MOV AH,9 
    INT 21H  
 
    MOV AH,1 
    INT 21H 
    SUB AL,48 
 
    MUL BL  
    AAM  
  
    MOV CX,AX  
    ADD CH,48 
    ADD CL,48 
     
     
    LEA DX,M59               
    MOV AH,9 
    INT 21H 
     
    MOV AH,2 
    MOV DL,CH 
    INT 21H 
    MOV DL,CL 
    INT 21H 
     
    MOV DL,'0' 
    INT 21H 
     
    ;FOR /- PRINT 
    MOV DL,47 
    INT 21H 
    MOV DL,45 
    INT 21H  
     
    ;GO BACK TO MAIN MENU 
     
    LEA DX,M60 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M61 
    MOV AH,9 
    INT 21H 
     
    LEA DX,M2 
    MOV AH,9 
    INT 21H  
     
    MOV AH,1 
    INT 21H 
    SUB AL,48 
     
    CMP AL,1 
    JE TOP 
     
    JMP EXIT    
     JMP EXIT 
     
     BUFFET: 
             ;BUFFET STARTS 
     
    LEA DX,SEJ ;NEWLINE 
    MOV AH,9 
    INT 21H 
      
    print M34 
    print M35 
    print M36 
    print M37 
    print M6 
     
    MOV AH,1 
    INT 21H 
    MOV BL,AL 
    SUB BL,48  
     
    CMP BL,1 
    JE THIRTY 
     
    CMP BL,2 
    JE SIXTY 
     
    CMP BL,3 
    JE NINETY  
    CMP BL,4 
    JE EIGHTY 
    JMP INVALID          
   
   INVALID: 
    LEA DX,M55 
    MOV AH,9 
    INT 21H  
    LEA DX,M56  
    MOV AH,9 
    INT 21H 
    JMP EXIT  
     EXIT: 
    MOV AH,4CH 
    INT 21H 
    end main 