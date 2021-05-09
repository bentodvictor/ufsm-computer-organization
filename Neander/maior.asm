;---------------------------------------------------
; Programa: Maior entre 2 numeros diferentes
; descricao: c <- maior(a,b)
;
;       if ( a > b )
;           c = a;
;       else
;           c = b;
;
;---------------------------------------------------

; obtem -b em complemento de 2
    lda b               ; 
    not                 ; 
    add UM              ; -b

; Verifica se a > b.
; Se (a - b) < 0, entao b eh o maior
    add a               ; (a - b)  
    jn b_maior          ; Se resultado < 0, entao b � o maior
    lda a               ; senao a eh o maior (AC <- a)
    jmp fim

b_maior:
    lda b   	        ; b eh o maior (AC <- b)

fim:
    sta c               ; c <- AC (c <- maior(a,b))
    hlt                 ; para o processador

; definicao de variaveis
org 80h                 ; Indica o endereco de inicio da area de dados
    a: db 23h
    b: db 32h
    c: db 0
    UM: db 1