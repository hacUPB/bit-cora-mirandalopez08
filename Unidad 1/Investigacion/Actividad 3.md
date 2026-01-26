# Actividad 3

#### Identifica una instrucción que use la ALU y explica qué hace.

#### ¿Para qué sirve el registro PC?
El registro PC sirve para mostrar cual será la siguiente instrucción que será ejecutada por el programa

#### ¿Cuál es la diferencia entre @i y @READKEYBOARD?
*@i* sirve para darle un nombre a un espacio en la memoria y se almacenará apartir de la casilla 16 hasta la 16384, puede ser utilizada para almacenar datos que se usarán más adelante, esto va a buscarlo en la **RAM**, por otro lado *@READKEYBOARD* sirve para guardar un numero de casilla pero llamando una etiqueta, es muy util para los condicionales de JUMP, este lo buscará en la **ROM**

#### Describe qué se necesita para leer el teclado y mostrar información en la pantalla.
Pra leer el teclado es necesario primero llamar @KBD, esto nos llevará a la casilla 24576, alli se almacena la informacion del teclado y para guardar el numero se puede utiizar *D=M*. Para escribir informacion en la pantalla es posible usar @SCREEN que nos llevará a la casilla 16384 y comenzar aasignarle valores 

#### Identifica un bucle en el programa y explica su funcionamiento.

```asm


```
#### Identifica una condición en el programa y explica su funcionamiento.