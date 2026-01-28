@5
D=M        //guarda el valor que hay en 5 en D

@10
D=D-A      // resta el valor que está en 5 (D) con el valor que está en A que es 10

@MENOR
D;JLT      // Si el valor que está en 5 es menor entonces va a saltar a la etiqueta MENOR, si no va a continuar

// cuando el valor en 5 es mayor o igual a 10
@7
M=0        // guardar 0 en la dirección 7
@FIN       // saltar a la etiqueta fin
0;JMP

(MENOR)    // etiqueta menor
@7
M=1        // guardar 1 en la dirección 7

(FIN)
@FIN
0;JMP     // Bucle para finallizar el programa
