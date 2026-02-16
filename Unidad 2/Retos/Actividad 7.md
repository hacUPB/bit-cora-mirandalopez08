# Actividad 7

## Parte 1: recuperación de conocimiento (Retrieval Practice)

### 1. Explica cómo se representa y manipula un puntero en el lenguaje ensamblador de Hack. Describe las operaciones equivalentes a p = &a (asignar dirección) y *p = 20 (escribir a través del puntero) usando instrucciones de ensamblador.

En nand2tetris un puntero se representa como una variable que guarda una dirección de memoria. Es decir, en vez de guardar un número normal, guarda la posición donde está otra variable.
Para asignar la dirección de una variable a un puntero, lo que se hace es tomar la dirección de esa variable y guardarla en la variable que hace de puntero.
Cuando se quiere escribir a través del puntero, primero se obtiene la dirección que está guardada en él, luego se usa esa dirección para ir a esa posición de memoria y modificar el valor que hay allí.
En Hack esto se logra usando el registro A para cambiar a la dirección almacenada y después escribir el valor en M. Así se simula el comportamiento de un puntero.

### 2. ¿Cómo implementarías el acceso a un elemento de un arreglo, como arr[j], en lenguaje ensamblador? Describe el rol de la dirección base del arreglo y el índice j en esta operación.

Para acceder a un elemento de un arreglo en Hack, se necesita conocer la dirección base del arreglo y el índice que indica qué posición queremos.
El arreglo ocupa posiciones consecutivas en memoria. La dirección base indica dónde empieza el arreglo. El índice indica cuántas posiciones debemos avanzar desde esa base.
Entonces, para acceder a un elemento, se suma la dirección base con el índice. El resultado es la dirección exacta del elemento dentro del arreglo. Luego se puede leer o modificar el valor en esa dirección.
En resumen, el acceso a un arreglo en Hack se hace calculando manualmente la dirección usando base + índice, porque el lenguaje no tiene arreglos como tal, sino solo posiciones de memoria consecutivas.

## Parte 2: reflexión sobre tu proceso (Metacognición)

### 1. ¿Cuál fue el concepto más abstracto o difícil de “traducir” de C++ a ensamblador en esta unidad (punteros, ciclos, arreglos)? ¿Qué hiciste para lograr entenderlo?

Puntero fue el más dificil para mi, pues los ciclos son un concepto que entiendo por lenguajes de alto nivel pero el puntero me pareció un tema más confuso y realmente me costaba mucho entender la funcionalidad de el puntero en un código por lo que fue bastante complejo comprenderlo

### 2. En la Actividad 06 se sugirió construir el programa “PASO A PASO mediante pruebas”. ¿Cómo te ayudó este enfoque a manejar la complejidad del problema?

Crear el programa por partes me permitió experimentar varias hipotésis, comprender algunas cosas y entender que el programa cada vez podía ser un poco más corto pero tener funcionalidades más amplias, hacer el proceso paso a paso me permitió crear códigos, buscar y comprender el significado de ciertas funciones y lograr conclusiones

### 3. Esta unidad fue el “puente” hacia C++. ¿Qué concepto de bajo nivel te sientes más seguro de poder identificar cuando lo veas implementado en C++?

Considero que ciclos (con o sin condicionales) serían los más faciles de identificar especialmente porque ya los he utilizado en otro slenguajes pero también porque logré identificarlos y comprenderlos en un código
