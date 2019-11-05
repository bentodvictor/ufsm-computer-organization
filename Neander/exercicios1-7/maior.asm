;---------------------------------------------------
; Programa: Maior entre 2 números diferentes
; Descrição: c <- maior(a,b)
;
;       if ( a > b )
;           c = a;
;       else
;           c = b;
;
;---------------------------------------------------

; Obtém -b em complemento de 2
    lda b               ; 
    not                 ; 
    add UM              ; -b

; Verifica se a > b.
; Se (a - b) < 0, então b é o maior
    add a               ; (a - b)  
    jn b_maior          ; Se resultado < 0, então b é o maior
    lda a               ; Senão a é o maior (AC <- a)
    jmp fim

b_maior:
    lda b   	        ; b é o maior (AC <- b)

fim:
    sta c               ; c <- AC (c <- maior(a,b))
    hlt                 ; Pára o processador

; Definição de variáveis
org 80h                 ; Indica o endereço de início da área de dados
    a: db 23h
    b: db 32h
    c: db 0
    UM: db 1