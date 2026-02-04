@20496
D=A
@i
M=D

@i
A=M
M=-1

(READKEYBOARD)
    
    @KBD
    D=M
   
    @100
    D=D-A
    @RIGHT
    D;JEQ
    
    @KBD
    D=M
    @105
    D=D-A
    @LEFT
    D;JEQ
    
    @READKEYBOARD
    0;JMP

(RIGHT)
    @i
    A=M
    M=0

    @i
    M=M+1

    @i
    A=M
    M=-1

    @READKEYBOARD
    0;JMP

(LEFT)
    @i
    A=M
    M=0

    @i
    M=M-1

    @i
    A=M
    M=-1

    @READKEYBOARD
    0;JMP
