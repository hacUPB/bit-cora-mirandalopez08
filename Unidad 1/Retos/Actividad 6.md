# Actividad 6

### Sin consultar tus apuntes, el simulador o cualquier otro material, responde con tus propias palabras a las siguientes preguntas. ¡No te preocupes por la perfección! El objetivo es ver qué recuerdas ahora mismo.

## Parte 1: recuperación de conocimiento (retrieval practice)
1. Describe con tus palabras las tres fases del ciclo Fetch-Decode-Execute. ¿Qué rol juega el Program Counter (PC) en este ciclo?
*Fetch* se utiliza para leer la siguiente instrucción que va a ocurrir en el código
*Decode* se utiliza para leer esta instrucción y pasarla a binario para poder comprender cual es la instrucción enviada 
*Execute* se utiliza para ejecuatarla después de comprenderla
Es un ciclo de tres pasos que se repetirán en cada una de las instrucciones enviadas, el *Program counter* es utilizado pues este es el que indica en que instrución se encuentra el programa en este momento

2. ¿Cuál es la diferencia fundamental entre una instrucción-A (que empieza con @) y una instrucción-C (que involucra D, M, A, etc.) en el lenguaje ensamblador de Hack? Da un ejemplo de cada una.
La instrucción A sirve para lamar un espacio en la memoria, usando el @ es posible llamar cualquier número porque lo que hará la instruccón será buscará en cualquier espacio de la memoria, po ejemplo si escribo @19 se irá a buscar el espacio 19, a partir de esto lo que haga con el valor 19 dependerá de la siguiente instrucción, por otro lado las instrucciones C sirven para realizar cálculos o asignar valores, no están diseñadas para llamr valores específios si no para utilizar estos valores, ya sea guardandolos en un espacio de memoria o realizando cálculos con ellos, un ejemplo sería M = D en este caso si comencé con @19 y luego escribo M = D el valor que esté guardado en D va a almacenarse en RAM 19

3. Explica la función de los siguientes componentes del computador Hack: el registro D, el registro A y la ALU.
El registro D sirve para guardar datos que llamé previamente y es possible utilizar estos numeros almacenados en D apara realizar operaciones de sumas, restas o igualdades, el registro A por otra parte está para llamar datos que pueden ser de la RAM o la ROM, aqui puedo llamar cualquier numero, por ultimo la ALU es la parte que hace las cuentas y las operaciones lógicas. Suma, resta o compara números que vienen del registro D y del registro A (o de la memoria). El resultado luego se guarda en algún registro.

4. ¿Cómo se implementa un salto condicional en Hack? Describe un ejemplo (p. ej., saltar si el valor de D es mayor que cero).
un salto condicional se aplica cuando necesitamos que cierta acción se ejecute dependiendo de el valor que esté leyemdo nuestro código, por ejemplo, si necesito que salte si el valor de D es mayor que cero voy a comparar el valor que está guardado en D con 0, si e valor es mayor va a saltar a la parte del código que se le sea indicado, si no terminará ahi 
```asm 
@20
D=A
@10
D=D-A
@10
0;JGT
```

5. ¿Cómo se implementa un loop en el computador Hack? Describe un ejemplo (p. ej., un loop que decremente un valor hasta que llegue a cero).
Un Loop se implementa como una manera de que un evento se repita varias veces, a veces hasta que cumpla una función y otras pueden ser infinitos, por ejemplo si quiero hacer que se sumen los valores del 1 al 5 debo hacer unloop que almacene los valore sy vaya incrementando desde el 1 al 5 para lograr que el resultado si sea correcto 

6. ¿Cuál es la diferencia entre la instrucción D=M y la instrucción M=D?
D=M significa que el valor que esté guardado en M en su casilla correspondiente se va a guardar temporalmente en D, por otro lado M=D significa que el valor que está guardado temporalmente en D ahora va a guardarse en la posición de memoria de M

7. Describe brevemente qué se necesita para leer un valor del teclado (KBD) y para “pintar” un pixel en la pantalla (SCREEN).
Para leer el teclado es necesario revisar si el valor en el numero de memoria del teclado es 0 u otro numero diferente, si no es 0 significa que una tecla está siendo presionada, en la pantalla es necesario cambiar el numero en el espacio de memoria para que se cambien los pixeles

## Parte 2: reflexión sobre tu proceso (metacognición)
1. ¿Cuál fue el concepto o actividad más desafiante de esta unidad para ti y por qué?
El concepto más desafiante fue el de los loops pues me parece que a veces puede llegar a ser confuso, muchas veces cuando los loops tienen etiquetas puedo llegar a confundirme como funcionará el programa o como debo organizarlo

2. La metodología de “predecir, ejecutar, observar y reflexionar” fue central en nuestras actividades. ¿En qué momento esta metodología te resultó más útil para entender algo que no tenías claro?
Al momento de hacer programas desde cero necesitaba ir planteando mis ideas, probandolas y analizando cuales eran los posibles errores para corregirlo más adelante 

3. Describe un momento “¡Aha!” que hayas tenido durante estas dos semanas. ¿Qué estabas haciendo cuando ocurrió?
Cuando estabamos hablando sobre las pantallas y teclados me sentía muy confundida al principio pero cuando el profesor hizo el ejemplo en el programa sobre llenar toda la pantalla entendí como funcionaba finalmente y me sentí mucho mejor

4. Pensando en la próxima unidad, ¿Qué harás diferente en tu proceso de estudio para aprender de manera más efectiva?
Intentar poner los conocimientos nuevos a prueba esto me ayudará a entender como se ve lo aprendido en el mundo real y por ende comprenderé como se lleva a cabo de forma lógica