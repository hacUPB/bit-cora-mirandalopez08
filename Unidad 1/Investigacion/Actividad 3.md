# Actividad 3

#### Identifica una instrucción que use la ALU y explica qué hace.

#### ¿Para qué sirve el registro PC?
El registro PC sirve para mostrar cual será la siguiente instrucción que será ejecutada por el programa

#### ¿Cuál es la diferencia entre @i y @READKEYBOARD?
*@i* sirve para darle un nombre a un espacio en la memoria y se almacenará apartir de la casilla 16 hasta la 16384, puede ser utilizada para almacenar datos que se usarán más adelante, esto va a buscarlo en la **RAM**, por otro lado *@READKEYBOARD* sirve para guardar un numero de casilla pero llamando una etiqueta, es muy util para los condicionales de JUMP, este lo buscará en la **ROM**

#### Describe qué se necesita para leer el teclado y mostrar información en la pantalla.
Pra leer el teclado es necesario primero llamar @KBD, esto nos llevará a la casilla 24576, alli se almacena la informacion del teclado y para guardar el numero se puede utiizar *D=M*. Para escribir informacion en la pantalla es posible usar @SCREEN que nos llevará a la casilla 16384 y comenzar aasignarle valores 

#### Identifica un bucle en el programa y explica su funcionamiento.

En el código hay varios bucles, el primero que pude identificar es el que está diseñado para que se lea si hay una tecla oprimida, en caso de que sí el código pasará a *KEYPRESSED* en ese punto nuevamente el código pasará a buscar si aún se está oprimiendo una tecla y eliminará la información para volver a *READKEYBOARD* y comenzar el ciclo nuevamente
El código mostrado a continuación no es el código completo si no una versión corta poara ejemplificar el caso mencionado anteriormente 
```asm
(READKEYBOARD) // etiqueta que sirve para nombrar una parte del código
@KBD 
D=M
@KEYPRESSED
D;JNE // Jump if not equal, en este caso si se está oprimiendo una tecla va a saltar a KEYPRESSED


(KEYPRESSED) // etiqueta que sirve para nombrar una parte del código
@i
D=M
@KBD
D=D-A
@READKEYBOARD
D;JGE // cuando se termine de presionar la tecla, el código volverá a buscar si se está oprimiento otra tecla
```
#### Identifica una condición en el programa y explica su funcionamiento.

En este fragmento del código hay una condicion establecida para deterinar si una tecla está siendo oprimida o no, en este caso se realiza llamando al teclado y viendo que valor se encuentra en *M* en este caso si el valor es 0 significa que ninguna tecla está siendo presionada, pero si el valor es diferente de 0 una tecla sí está siendo presionada y por ende saltará a KEYPRESSED

```asm
(READKEYBOARD) // etiqueta que sirve para nombrar una parte del código
@KBD 
D=M
@KEYPRESSED
D;JNE // Jump if not equal, en este caso si se está oprimiendo una tecla va a saltar a KEYPRESSED
```
