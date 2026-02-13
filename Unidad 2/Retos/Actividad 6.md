Inicialmente intenté hacer el programa con un ciclo, pero no supe como cintinuar realizando el programa porwur rl profesor nos dijo que deberiamos poder sumar cualquier numero por lo que decidí hacerlo uno por uno, este es el programa que intenté inicialmente pero no lograba probarlo porque tenía un error
```
@100
D=A 
@ARR 
M=D 

@j
M=1

@sum
M = 0

(ARREGLO)
@j 
D=M

@ARR
A=M
M=D
D=D+1

@j 
M=D

@11
D=D-A 
@END
D;JGE

@ARR 
D=M
D=D+1
M=D
@ARREGLO 
0;JMP

(LOOP)
@ARR
D=M
@sum
M=D-1

@100
D;JLT
```
