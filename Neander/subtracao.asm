;---------------------------------------------------
; Programa: Subtracao
; Descricao: c <- a - b
;---------------------------------------------------

; Obtem -b em complemento de 2
   lda b                    ; 
   not                      ; 
   add um                   ; -b

; c <- a + (-b)
   add a                    ; a + (-b)
   sta c                    ; c <- (a - b)
   hlt                      ; para o processador

; Definicao de variaveis
org 80h             ; Indica o endereco de inicio da are de dados
   a:   db 1
   b:   db 10
   c:   db 0
   um:  db 1	