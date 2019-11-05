;---------------------------------------------------
; Programa: Subtração
; Descrição: c <- a - b
;---------------------------------------------------

; Obtém -b em complemento de 2
   lda b                    ; 
   not                      ; 
   add um                   ; -b

; c <- a + (-b)
   add a                    ; a + (-b)
   sta c                    ; c <- (a - b)
   hlt                      ; para o processador

; Definição de variáveis
org 80h             ; Indica o endereço de início da área de dados
   a:   db 1
   b:   db 10
   c:   db 0
   um:  db 1	