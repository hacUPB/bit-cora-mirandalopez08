@100
D=A
@ARR
M=D

@11
D=A
@100
M=D

@233
D=A
@101
M=D

@23
D=A
@102
M=D

@77
D=A
@103
M=D

@112
D=A
@104
M=D

@61
D=A
@105
M=D

@67
D=A
@106
M=D

@98
D=A
@107
M=D

@900
D=A
@108
M=D

@810
D=A
@109
M=D

@sum
M=0

@j
M=0

(LOOP)

@j
D=M
@10
D=D-A
@END
D;JGE

@ARR
D=M        
@j
A=D+M      
D=M       

@sum
M=M+D

@j
M=M+1

@LOOP
0;JMP

(END)
@END
0;JMP
