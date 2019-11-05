;---------------------------------------------------
; Programa: Somatório impar
; Descrição: Soma números ímpares de 'a' até 'b'. O somatório é armazenado em 'c'.
;
;       while (a <= b) {
;           if ( (a%2) != 0 )
;               c = c + a;
;           a++;
;       }
;
;               OU
;
;       while (a <= b) {
;           if ( (a & 1) != 0 ) /* &: and bit-a-bit */
;               c = c + a;
;           a++;
;       }
;
;---------------------------------------------------


; while: Teste no início do laço
; Verifica se a <= b.
; Se a > b quebra o laço, ou seja, se (b - a) < 0 
while:
    lda a                               ; 
    not                                 ;
    add um                              ; Obtém -a
                        
    add b                               ; Obtém (b - a)         
    jn fim                              ; Se (b - a) < 0, então a > b, portanto sai do laço
  
; Verifica paridade de a 
; Se (a & 1) = 0 então a é par
    lda a                               ;
    and um                              ; (a & 1)
    jz par                              ; Se (a & 1) = 0, então a é par
    
; Se a é impar, acumula em c
    lda a                               ;
    add c                               ;
    sta c                               ; c <- c + a

par:
    lda a                               ;
    add um                              ;
    sta a                               ; a++
    
    jmp while

fim:
    hlt

 ; Definição de variáveis (área de dados inicia imediatamente após a área de programa)
   a:        db 1
   b:        db 6
   c:        db 0
   um:       db 1

   