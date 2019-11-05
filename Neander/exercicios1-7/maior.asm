;---------------------------------------------------
; Programa: Maior entre 2 n�meros diferentes
; Descri��o: c <- maior(a,b)
;
;       if ( a > b )
;           c = a;
;       else
;           c = b;
;
;---------------------------------------------------

; Obt�m -b em complemento de 2
    lda b               ; 
    not                 ; 
    add UM              ; -b

; Verifica se a > b.
; Se (a - b) < 0, ent�o b � o maior
    add a               ; (a - b)  
    jn b_maior          ; Se resultado < 0, ent�o b � o maior
    lda a               ; Sen�o a � o maior (AC <- a)
    jmp fim

b_maior:
    lda b   	        ; b � o maior (AC <- b)

fim:
    sta c               ; c <- AC (c <- maior(a,b))
    hlt                 ; P�ra o processador

; Defini��o de vari�veis
org 80h                 ; Indica o endere�o de in�cio da �rea de dados
    a: db 23h
    b: db 32h
    c: db 0
    UM: db 1