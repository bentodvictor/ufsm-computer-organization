;---------------------------------------------------
; Programa: Triângulo
; Descrição: dado 3 lados, verifica se é possível formar um triângulo 
;
;       int a = 5;
;       int b = 3;
;       int c = 3;
;       int triangulo = 0;
;   
;       if ( a < (b + c) && b < (a + c) && c < (a + b) )
;           triangulo = 1;
;       else
;           triangulo = 0;
;
;---------------------------------------------------


; Verifica se a < (b + c)
; Se a - (b + c) < 0 então a < (b + c)
    lda b                               ; 
    add c                               ; Obtém (b + c)
    not                                 ; 
    add um                              ; Obtém -(b + c)
    add a                               ; a - (b + c)
    jn b_menor_ac                       ; Se a - (b + c) < 0 salta para b_menor_ac
    jmp else                            ; Senão salta para else
    
; Verifica se b < (a + c)
; Se b - (a + c) < 0 então b < (a + c)   
b_menor_ac:    
    lda a                               ; 
    add c                               ; Obtém (a + c)
    not                                 ; 
    add um                              ; Obtém -(a + c)
    add b                               ; b - (a + c)
    jn c_menor_ab                       ; Se b - (a + c) < 0 salta para c_menor_ab
    jmp else                            ; Senão salta para else
    
    
; Verifica se c < (a + b)
; Se c - (a + b) < 0 então c < (a + b) 
c_menor_ab:    
    lda a                               ; 
    add b                               ; Obtém (a + b)
    not                                 ; 
    add UM                              ; Obtém -(a + b)
    add c                               ; c - (a + b)
    jn forma_triangulo                  ; Se c - (a + b) < 0 salta para forma_triangulo
    jmp else                            ; Senão salta para else
    
forma_triangulo:    
    lda UM                              ; Forma triângulo (AC <- 1)
    jmp fim
    
else:
    lda ZERO                            ; Não forma triângulo (AC <- 0)
    
fim:
    sta triangulo                       ; triangulo <- resultado da verificação
    hlt  
   
 ; Definição de variáveis (área de dados inicia imediatamente após a área de programa)
   a:           db 9
   b:           db 3     
   c:           db 3
   triangulo:   db 0
   ZERO:        db 0
   UM:          db 1