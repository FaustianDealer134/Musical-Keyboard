COD SEGMENT
    ASSUME CS:COD, DS:COD, ES:COD, SS:COD
    ORG 100h
MAIN PROC NEAR
INICIO:;ajustes iniciais
    MOV AX,03h ;ajusta o modo de v?deo: AL = 03h, modo texto
    INT 10h;80x25, 16 cores, 8 p?ginas
    MOV CX,0007h ; cursor em formato cheio
    INT 10h; 80x25, 16 cores, 8 p?ginas
    LEA DX,MSGA
    MOV AH,09h
    INT 21h
    CALL PULA
    CALL PULA
    LEA DX,MSGB
    MOV AH,09h
    INT 21h
    CALL PULA
    CALL PULA
READ: ;switch para pegar a tecla digitada
    MOV AH,00h
    INT 16h
    CMP AL,71h
    JE NCA
    CMP AL,77h
    JE NCSHARPA
    CMP AL,65h
    JE DA
    CMP AL,72h
    JE DSHARPA
    CMP AL,74h
    JE EA
    CMP AL,79h
    JE FA
    CMP AL,75h
    JE FSHARPA
    CMP AL,69h
    JE GA
    CMP AL,6Fh
    JE GSHARPA
    CMP AL,70h
    JE AA
    CMP AL,61h
    JE ASHARPA
    CMP AL,73h
    JE BA
    CMP AL,1Bh
    JE RESUME
DEFAULT:
    LEA DX,MSGD
    MOV AH,09h
    INT 21h
    CALL PULA
    CALL PULA
	JMP READ
RESUME:
    LEA DX,MSGC
    MOV AH,09h
    INT 21h
    CALL PULA
    CALL PULA
    MOV AH,00h
    INT 16h
    CMP AL,31h
    JE INICIOJ
    CMP AL,32h
    JE FIMJ
    LEA DX,MSGD
    MOV AH,09h
    INT 21h
    JMP RESUME
INICIOJ: ;jumps necessarios devido ao limite de jumps comparativos
    JMP INICIO
NCA:    
    JMP NC
NCSHARPA:
    JMP NCSHARP
DA:
    JMP D
DSHARPA:
    JMP DSHARP
EA:
    JMP E
FA:
    JMP F
FSHARPA:
    JMP FSHARP
GA:
    JMP G
GSHARPA:
    JMP GSHARP
AA:
    JMP A
ASHARPA:
    JMP ASHARP
BA:
    JMP B
FIMJ:
    JMP FIM
NC: ;preparacao das notas 
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 4560; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,01h;atributos do caractere
    MOV AL,'C';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    CALL PULA
    JMP READ
NCSHARP:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX,4304 ; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,01h;atributos do caractere
    MOV AL,'C';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    MOV BH,0h
    MOV AH,03h
    INT 10h
    INC DL
    MOV AH,02h
    INT 10h
    MOV BL,01h;atributos do caractere
    MOV AL,'#';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    DEC DL
    MOV AH,02h
    MOV BH,0h
    INT 10h
    CALL PULA
    JMP READ
D:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 4063; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,02h;atributos do caractere
    MOV AL,'D';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    CALL PULA
    JMP READ
DSHARP:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 3834; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,02h;atributos do caractere
    MOV AL,'D';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    MOV BH,0h
    MOV AH,03h
    INT 10h
    INC DL
    MOV AH,02h
    INT 10h
    MOV BL,02h;atributos do caractere
    MOV AL,'#';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    DEC DL
    MOV AH,02h
    MOV BH,0h
    INT 10h
    CALL PULA
    JMP READ
E:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 3619; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,03h;atributos do caractere
    MOV AL,'E';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    CALL PULA
    JMP READ
F:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 3416; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,04h;atributos do caractere
    MOV AL,'F';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    CALL PULA
    JMP READ
FSHARP:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 3224; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,04h;atributos do caractere
    MOV AL,'F';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    MOV BH,0h
    MOV AH,03h
    INT 10h
    INC DL
    MOV AH,02h
    INT 10h
    MOV BL,04h;atributos do caractere
    MOV AL,'#';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    DEC DL
    MOV AH,02h
    MOV BH,0h
    INT 10h
    CALL PULA
    JMP READ
G:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 3043; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,05h;atributos do caractere
    MOV AL,'G';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    CALL PULA
    JMP READ
GSHARP:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 2873; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,05h;atributos do caractere
    MOV AL,'G';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    MOV BH,0h
    MOV AH,03h
    INT 10h
    INC DL
    MOV AH,02h
    INT 10h
    MOV BL,05h;atributos do caractere
    MOV AL,'#';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    DEC DL
    MOV AH,02h
    MOV BH,0h
    INT 10h
    CALL PULA
    JMP READ
A:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 2711; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,06h;atributos do caractere
    MOV AL,'A';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    CALL PULA
    JMP READ
ASHARP:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 2559; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,06h;atributos do caractere
    MOV AL,'A';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    MOV BH,0h
    MOV AH,03h
    INT 10h
    INC DL
    MOV AH,02h
    INT 10h
    MOV BL,06h;atributos do caractere
    MOV AL,'#';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    DEC DL
    MOV AH,02h
    MOV BH,0h
    INT 10h
    CALL PULA
    JMP READ
B:;preparacao das notas
    MOV AL, 182
    OUT 43h, AL;prepara a nota
    MOV AX, 2415; d? central do piano (em decimal)
    OUT 42h, AL; manda byte menos significativo
    MOV AL, AH
    OUT 42h, AL; manda byte mais significativo
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    OR  AL, 00000011b  ; "seta" os dois bits menos significativos
    OUT 61h, AL; atualiza o valor na porta 61h ... reproduz
    MOV BX, 05h; determina a dura??o do som
    CALL DURA
    MOV BL,07h;atributos do caractere
    MOV AL,'B';caractere a ser escrito
    MOV AH,09h;
    MOV CX,1h;n?mero de vezes a escrever o caractere
    INT 10h
    CALL PULA
    JMP READ
DURA:;duracao da nota
    MOV CX, 0FFFFh
DURAC:
    DEC CX
    JNE DURAC
    DEC BX
    JNE DURA
    IN  AL, 61h; verifica qual o valor est? na porta 61h
    AND AL, 11111100b  ; "zera" os dois bits menos significativos
    OUT 61h, AL; atualiza valor na porta 61h, fim reprodu??o
    RET
PULA:;pula linha
    MOV AH,06h
    MOV DL,LF
    INT 21h
    MOV AH,06h
    MOV DL,CR
    INT 21h
    RET
FIM:
    MOV AH,4CH
    INT 21H
MAIN ENDP
;DATA
    LF EQU 0Ah ;line feed
    CR EQU 0Dh ;carriage return
    MSGA DB "BEM VINDO AO PROGRAMA DE TECLADO MUSICAL DE BRUNO E RAFAEL!",'$'
    MSGB DB "AS TECLAS UTILIZADAS SAO  Q=C, W=C#, E=D, R=D#, T=E, Y=F, U=F#, I=G, O=G#, P=A, A=A#, S=B E ESC EH UTILIZADO PARA SAIR.$"
    MSGC DB "PARA CONTINUAR COM O PROGRAMA DIGITE 1, PARA SAIR DIGITE 2.$"
    MSGD DB "O NUMERO DIGITADO NAO FOI IDENTIFICADO, TENTE NOVAMENTE$"
    
;DATA
COD ENDS
    END MAIN