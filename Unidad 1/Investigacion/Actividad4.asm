@5
D=M        //guarda el valor que hay en 5 en D

@10
D=D-A      // resta el valor que está en 5 (D) con el valor que está en A que es 10

@MENOR
D;JLT      // Si el valor que está en 5 es menor entonces va a saltar a la etiqueta MENOR

// Caso: RAM[5] >= 10
@7
M=0        // RAM[7] = 0
@FIN
0;JMP

(MENOR)
@7
M=1        // RAM[7] = 1

(FIN)
@FIN
0;JMP     // Bucle infinito (fin del programa)
