// Programa 1
// a = 10
@10
D=A
@a
M=D

// p = &a
@a
D=A
@p
M=D

// *p = 20
@20
D=A
@p
A=M
M=D

// Fin del programa
(END)
@END
0;JMP

// Programa 2

// a = 10
@10
D=A
@a
M=D

// b = 5
@5
D=A
@b
M=D

// p = &a
@a
D=A
@p
M=D

// b = *p
@p
A=M
D=M
@b
M=D

// Fin del programa
(END)
@END
0;JMP
