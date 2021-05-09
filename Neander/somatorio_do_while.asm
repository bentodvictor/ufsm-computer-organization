;---------------------------------------------------
; Programa: somatorio impar
; descricao: Soma numeros impares de 'a' ate 'b'. O somatorio eh armazenado em 'c'.
;
;       do {
;           if ( (a%2) != 0 )
;               c = c + a;
;           a++;
;       } while (a <= b);
;
;            OU
;
;       do {
;           if ( (a & 1) != 0 )     /* &: and bit-a-bit */
;               c = c + a;
;           a++;
;       } while (a <= b);
;---------------------------------------------------


; Verfica paridade de a 
; Se (a & 1) = 0 entao a eh par
do:    
    lda a                           ;
    and um                          ; (a & 1) 
    jz par                          ; Se (a & 1) = 0, entao a eh par
    
; Se a eh impar, acumula em c    
    lda a                           ;
    add c                           ; 
    sta c                           ; c <- c + a
                
par:                
    lda a                           ;
    add um                          ; 
    sta a                           ; a++
    
; do while: Teste no fim do laco
; Verifica se a <= b
; Se (a - b) <= 0 continua o laco.
    lda b                           ; 
    not                             ;
    add um                          ; obtem -b
  
    add a                           ; obtem (a - b)
    
    jn do                           ; Se (a - b) < 0, entao a < b, portanto repete laco       
    jz do                           ; Se (a - b) = 0, entao a = b, portanto repete laco

; (a - b) > 0  (a > b) 
fim:
   hlt

 ; definicao de variaveis (variaveis de dados inicia imediatamente variaveis a area de programa)
   a:        db 1
   b:        db 6
   c:        db 0
   um:       db 1
   