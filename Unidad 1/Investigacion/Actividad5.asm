@12
M=0        // iniciamos la casilla 12 en 0 para asegurarnos de que el valor sea 0

@1
D=A        // D = 1
@13
M=D        // en la casilla 13 se guarda el valor 1, esta casilla sera como un contador

(LOOP)     // inicio del ciclo

@13
D=M        // D = i
@6
D=D-A      // D = i - 6
@END
D;JGE      // Si i >= 6, salta a END (termina el ciclo)

@13
D=M        // D = i
@12
M=M+D     // suma = suma + i

@13
M=M+1     // i = i + 1

@LOOP
0;JMP      // Salta incondicionalmente a LOOP

(END)      // Etiqueta de fin del programa
@END
0;JMP      // Bucle infinito para detener la ejecución
