@SCREEN //163834
D=A
@i
M=D

(READKEYBOARD) //Etiquetas
@KBD //24576
D=M
@KEYPRESSED
D;JNE // condicional, compara d con 0 si d no es igual a 0 saltar a @keypressed
@i
D=M
@SCREEN
D=D-A
@READKEYBOARD
D;JLE
@i
M=M-1
A=M
M=0
@READKEYBOARD
0;JMP

(KEYPRESSED)
@i
D=M
@KBD
D=D-A
@READKEYBOARD
D;JGE
@16
A=M
M=-1
@i
M=M+1
@READKEYBOARD
0;JMP