


;****************************************
; Nome: Sub Rotina SEMAFORO-TOP
; Fun��o:Utilizando o programa do controle de sem�foro e utilizando interrup��es externas. Utilize dois bot�es conectados aos pinos INT0 e INT1 para simular os bot�es de pedestres em um sem�foro. Quando o bot�o INT0 for pressionado, fa�a o sem�foro de pedestres mudar para verde e o sem�foro de ve�culos para vermelho. Quando o bot�o INT1 for pressionado, fa�a o sem�foro de pedestres voltar ao vermelho.
;
; entrada: Run e depois: SW1 E SW2
;
; sa�da: (P1.0-P1.2)E (P1.5-P1.7)
;
;Frequ�ncia de execu��o:  10kHz
;
; vari�veis alteradas: ACC, R0 - R7 e B
;****************************************


;executar c�digo na frequ�ncia:  10kHz
; ATEN��O: Ao clicar em SW1, o c�digo fica em modo onde ambos os sem�foros piscam amarelo. Para sair desse modo, basta ativar a chave SW2 e desativar a chave SW1.

ORG 0000H
AJMP SEMAFORO

ORG 0003H
AJMP INT0

ORG 0013H
AJMP INT1

SEMAFORO:

MOV SP, #70H
CLR IT0
CLR IT1
SETB EX0
SETB EX1
SETB EA

CLR A
MOV R0, A
MOV R1, A
MOV R2, A
MOV R3, A
MOV R4, A
MOV R5, A
MOV R6, A
MOV R7, A

LOOP:
    MOV P1, #0CEH
ACALL delay20s
MOV P1, #06EH
ACALL delay400ms
MOV P1, #0EEH
ACALL delay400ms
MOV P1, #06EH
ACALL delay400ms
MOV P1, #0EEH
ACALL delay400ms
MOV P1, #06EH
ACALL delay400ms
MOV P1, #0EEH
ACALL delay400ms
MOV P1, #06EH
ACALL delay2s
MOV P1, #0B3H
ACALL delay20s
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H


AJMP LOOP



INT0:
    MOV P1, #0CEH
    ACALL delay2s
	MOV P1, #06EH
ACALL delay400ms
MOV P1, #0EEH
ACALL delay400ms
MOV P1, #06EH
ACALL delay400ms
MOV P1, #0EEH
ACALL delay400ms
MOV P1, #06EH
ACALL delay400ms
MOV P1, #0EEH
ACALL delay400ms
MOV P1, #06EH
ACALL delay2s
MOV P1, #0B3H
ACALL delay2s
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay2s
MOV P1, #0CEH
ACALL delay2s
    CLR IE0    
    RETI


INT1:
    MOV P1, #0B3H
    ACALL delay2s
	MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay400ms
MOV P1, #0B5H
ACALL delay400ms
MOV P1, #0B7H
ACALL delay2s
MOV P1, #0CEH
ACALL delay2s
    CLR IE1  
	reti   


delay2s:
    MOV R1, #5AH
delay2003:
    MOV R2, #5AH
delay2004:
	nop	
    NOP
    NOP
    NOP
    NOP
    NOP
    DJNZ R2, delay2004
    DJNZ R1, delay2003
    RET

delay400ms:
    MOV R1, #34H
delay2001:
    MOV R2, #34H
delay2002:
    NOP
    NOP
    NOP
    NOP
    NOP
    DJNZ R2, delay2002
    DJNZ R1, delay2001
    RET

delay20s:
LOOP2:
    MOV R0, #5
X40:
    MOV R1, #0AEH
delay5001:
    MOV R2, #0AEH
delay5002:
    NOP
    NOP
    NOP
    NOP
    NOP
    DJNZ R2, delay5002
    DJNZ R1, delay5001
    DJNZ R0, X40
    RET
