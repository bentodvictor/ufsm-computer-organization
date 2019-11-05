;---------------------------------------------------
; Programa: Somatório impar
; Descrição: Soma números ímpares de 'a' até 'b'. O somatório é armazenado em 'c'.
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
; Se (a & 1) = 0 então a é par
do:    
    lda a                           ;
    and um                          ; (a & 1) 
    jz par                          ; Se (a & 1) = 0, então a é par
    
; Se a é impar, acumula em c    
    lda a                           ;
    add c                           ; 
    sta c                           ; c <- c + a
                
par:                
    lda a                           ;
    add um                          ; 
    sta a                           ; a++
    
; do while: Teste no fim do laço
; Verifica se a <= b
; Se (a - b) <= 0 continua o laço.
    lda b                           ; 
    not                             ;
    add um                          ; Obtém -b
  
    add a                           ; Obtém (a - b)
    
    jn do                           ; Se (a - b) < 0, então a < b, portanto repete laço       
    jz do                           ; Se (a - b) = 0, então a = b, portanto repete laço

; (a - b) > 0  (a > b) 
fim:
   hlt

 ; Definição de variáveis (área de dados inicia imediatamente após a área de programa)
   a:        db 1
   b:        db 6
   c:        db 0
   um:       db 1
   