;---------------------------------------------------
; Programa: Subtra��o
; Descri��o: c <- a - b
;---------------------------------------------------

; Obt�m -b em complemento de 2
   lda b                    ; 
   not                      ; 
   add um                   ; -b

; c <- a + (-b)
   add a                    ; a + (-b)
   sta c                    ; c <- (a - b)
   hlt                      ; para o processador

; Defini��o de vari�veis
org 80h             ; Indica o endere�o de in�cio da �rea de dados
   a:   db 1
   b:   db 10
   c:   db 0
   um:  db 1	