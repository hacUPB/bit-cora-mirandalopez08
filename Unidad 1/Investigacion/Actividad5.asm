// Inicializar suma = 0
@12
M=0

// Inicializar contador i = 1
@1
D=A
@13
M=D        // RAM[13] será el contador i

(LOOP)
@13
D=M        // D = i
@6
D=D-A      // D = i - 6
@END
D;JGE      // Si i >= 6, salir del ciclo

// suma = suma + i
@13
D=M
@12
M=M+D

// i = i + 1
@13
M=M+1

@LOOP
0;JMP      // Volver al inicio del ciclo

(END)
@END
0;JMP      // Fin del programa (bucle infinito)
