# Actividad 4

## Experimento 1
En este experimento el código declara dos variables en el main, luego por medio de la función:
``` cpp
void* ptr = reinterpret_cast<void*>(&main);
```
lo que estoy haciendo es crear un puntero *ptr* que va a almacenar la dirección de memoria en la que está guardada la función main, esto se accede por medio de *&main*, después se va a imprimir en la pantalla el valor guardado en *ptr*, y finalmente el programa intenta cambiar el valor que está dentro de la RAM, en este caso quiere borrar el main y poner un cero en esa direccion de memoria donde está almacenado

## Experimento 2
En este experimento se está siguiendo un procedimiento similar a el de el anterior solo que se crea una constante global 
```cpp 
const char* const mensaje_ro = "Hola, memoria de solo lectura";
```
En la siguienta parte del código se crea una variable de un puntero, pero este estará asignado como un char y no un void como en la anterior, debido a esto el valor que se mostrará en la pantalla será un dibujo extraño y no una direccion de memoria directamente, el resultado será el siguiente:
"Voy a modificar la memoria en la direccion: └╗Ü▓¸". Igual que en el anteror está intentando cambiar la información que hay dentro de la dirección de memoria que se llamó anteriormente porque es una sección de solo lectura

## Experimento 3
En este experimento se declaran dos variables globales (que pueden ser utilizadas en cualquier parte del código), primero se muestran estas variables como fueron puestas inicialmente, luego se cambian los valores que contienen estas variables denttro de la función main y se muestran los nuevos valores almacenados en estas variables, en este caso simplemente se mostrarán los nuevos valores

## Experimento 4
En esta situacion el código presenta un error que no le permite mostrar los resultados, la variable que está decalrada en 
```cpp
void funcionConStatic() {    
		static int var_estatica = 100;    
		cout << "Dirección de var_estatica (static): " << &var_estatica << endl;
}
```
solamente está declarada dentro de esta función, por lo que cuando se llama en el main no es una variable que esté declarada en este mismo por lo que en palabras más simples no existe para el main, por lo mismo no es posible realizar ninguna modificación en este caso y por esto mismo el código muestra errores y no muestra el resultado completo, seria necesario llamar la función y no la variable en específico.

## Experimento 5
en este experimento se crean dos variables, una estática y otra que no es estática, luego se crea un ciclo que va a aumentar dichas variables de 1 en 1 hasta que se hayan aumentado 5, en este caso la variable estática va a ir modificandose y conservando la nueva información por lo que al final el valor será de 105, por otro lado la variable que no es estática no almacenará la nueva información y por ende no se le sumará nada, su valor inicial y final serán los mismos.

## Experimento 6 
Aqui se crea un arreglo, inicialmente se creauna variable local que determina el tamaño del aarreglo, luego se declara la variable del arreglo y se le atribuye su respectivo tamaño, fianlmente se inicializa un ciclo que va a recorrer todos los espacios del arreglo, además indicará en que espacio de memoria está almacenado cada uno, finalmente se borra la informacion del arreglo

# Actividad 5 
*1. Explica qué ocurre al copiar un objeto en C++ y en C#. ¿Qué diferencias encuentras?*

en **C#** el código crea el objeto original, le da sus atributos, luego estblece que la copia es igual al original y cuando se imprime la copia se le da sus valores correspondientes pero cuando se imprime el original nuevamente todos sus valores se modificaron a los de la copia. Por otra parte en **C++** se crea el objeto original y se le asignan sus respectivas variables, luego se crea una referenciacion a este mismo objeto, se crea el objeto de la copia y se modifica la información, pero al imprimir el original los valores iniciales se mantienen en el mismo, se está creando una verdadera copia del objeto y no modificando los valores iniciales como en *C#* pero con el punto p que es la referenciacion a el objeto original si se le atribuyen valores a este mismo se modificarán los valores originales.

*2. ¿Qué es `copia` en C++ y en C#? ¿Es una copia independiente de `original`?*

En **C++** una copia referencia al objeto original, le puede atribuir nuevas características o valores pero al final es independiente del objeto original, por otra parte en **C#** la copia es entregarle los valores del original a una copia y permitir que se modifiquen los valores de este mismo en un "nuevo objeto" pero igualmente los valores del original también van a cambiar.

## Actividad integradora
### A. Predicción (sin ejecutar el código):
**1. ¿Cuál será la salida final en la consola de este programa?**
```
--- Experimento con paso de parámetros ---
Valor inicial de val_A: 20
-> Dentro de sumaPorValor, 'a' ahora es: 30
Valor final de val_A: 20

Valor inicial de val_B: 20
-> Dentro de sumaPorReferencia, 'a' ahora es: 30
Valor final de val_B: 30

Valor inicial de val_C: 20
-> Dentro de sumaPorPuntero, '*a' ahora es: 30
Valor final de val_C: 30

--- Experimento con variables estáticas ---

-> Llamada a ejecutarContador. Valor de contador_estatico: 1
-> Llamada a ejecutarContador. Valor de contador_estatico: 2
-> Llamada a ejecutarContador. Valor de contador_estatico: 3
```

**2. Escribe la salida completa que esperas.**
Se crean las variables locales que van a contener los valores iniciales, luego cada una se pasa por cierto procedimiento. El *val_A* va a pasar por una suma por valor, en este caso su valor original será 20. el valor cuando entra a la función será 30 pero cuando salgan de la función su valor final va a seguir siendo 20, debido a que la variable original no será modificada, por otra parte en *val_B*, suma por referencia y *val_C* suma por puntero van a modificarse dentro de la función pero también en el valor final, lo que significa que el valor inicial será 20 pero el valor dentro de la función y el valor final serán 30. en *val_B* se crea una referenciación directa al objeto original y se modifica su valor, y en *val_C* se referencia el espacio de memoria en el que está almacenado y se modifica su valor original. Por otra parte en el *contador* al ser una variable estática el valor se va a conservar, por lo que si aumentará de 1 en 1 hasta llegar a 103 ya que el contador se llama 3 veces. 

**3. Dibuja un mapa de memoria conceptual de este programa justo antes de que main finalice.** *Debes indicar en qué segmento de memoria (Stack, Heap, Datos Globales/Estáticos, Código) se encontraría cada una de las siguientes variables: contador_global, contador_estatico, val_A, val_B, val_C (dentro de main), el parámetro a de la función sumaPorValor, la función main misma.* 

|variables globales y estáticas  | 
|--------------------------------|
|contador_global|
|    |
|static int var_estatica |

|Heap | 
|--------------------------------|
|int* arr = new int[tam]|

|stack | 
|--------------------------------|
|int a = 10;|
|int b = 20;|
|int c = suma(a, b);|
|int tamArray = 10;|
|int* arrayHeap = crearArrayHeap(tamArray);|

**1. Compara la salida real con tu predicción. Si hubo diferencias, explica por qué ocurrieron. Evidencia clave: capturas de pantalla antes y después de los puntos de interés (¿Cuáles son esos puntos? -> tu tarea analizarlo).**
No hubo diferencias, desde mi punto de vista los puntos de interés son cada que A, B y C entran a su respectiva suma y se da su resultado y luego cuando salen de dicha suma y se obtiene el resultado final pues es donde vemos si la variable original se modificó o no, también los puntos donde se llama la función del contador para verificar si se está sumando

**2. Describe qué demuestran estas capturas sobre la diferencia entre los diferentes tipos de paso por parámetros analizados.** 

**3. Explica con tus propias palabras el comportamiento de contador_estatico. ¿Por qué “recuerda” su valor entre llamadas a la función ejecutarContador? ¿En qué se diferencia de una variable local normal?**
Al estar estático cuando se le vayan añadiendo valores los va a guardar en la variable original, si no fuera de esta manera si no que no fuera estática los valores se almacenarían dentro de la función pero al salir de esta el contador se reiniciaria a su valor original, en este caso 0


