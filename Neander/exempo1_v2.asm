;---------------------------------------------------
; Programa:
; Autor:
; Data:
;---------------------------------------------------

org 0h ; Indica o endereço de início da área de instruções 
	LDA a    ; AC ← a
	ADD b     ; AC ← AC + b
	ADD c    ; AC ← AC + c
	STA res   ; res ← AC 
	HLT     ; Pára o processador

; Definição de variáveis
org 80h  ; Indica o endereço de início da área de dados
	a: db 20h    ; a = MEM(128) ← 1
	b: db 2    ; b = MEM(129) ← 2
	c: db 3    ; c = MEM(130) ← 3
	res: db 0  ; res = MEM(131) ← 0

