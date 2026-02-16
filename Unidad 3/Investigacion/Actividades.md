# Actividad 1 
Comenzamos familiarizandonos con el uso de C ++ y como se veia un código somple, luego comenzamos a añadir un nuevo código 
```cpp
#include <iostream>
int sum(int a, int b) {
	return a + b;
}

int main() {
	int a = 5;
	int b = 7;
	std::cout << "La suma de " << a << " y " << b << " es " << sum(a, b) << "\n";
}
```
1. ¿Para qué sirven los breakpoints?

junto a estre aprendimos a usar los *breakpoints* que son puntos en los que se detendrá el código, sirven para evaliuar las accines del código paso a paso y poder identificar posibles fallas, errores o cosas por mejorar en secciones específicas

2. ¿Para qué se usa la ventana de depuración Autos?
Se utiliza para llevar a cabo varias funciones, mientras el código está corriendo pero está pausado por un *breakpoint* podemos correr las instrucciones una a una, saltarnos pedazos y volver al inicio con el propósito de evaluar el código por partes

# Actividad 2

```cpp
#include <iostream>
using namespace std;

// Función que modifica el parámetro pasado por valor
void modificarPorValor(int n) {
	cout << "Dentro de modificarPorValor, valor inicial: " << n << endl;
	n += 5;
	cout << "Dentro de modificarPorValor, valor modificado: " << n << endl;
}

// Función que modifica el parámetro pasado por referencia
void modificarPorReferencia(int& n) {
	cout << "Dentro de modificarPorReferencia, valor inicial: " << n << endl;
	n += 5;
	cout << "Dentro de modificarPorReferencia, valor modificado: " << n << endl;
}

// Función que modifica el parámetro utilizando punteros
void modificarPorPuntero(int* n) {
	cout << "Dentro de modificarPorPuntero, valor inicial: " << *n << endl;
	*n += 5;
	cout << "Dentro de modificarPorPuntero, valor modificado: " << *n << endl;
}

int main() {
	int a = 10;    int b = 10;    int c = 10;
	cout << "Valor inicial de a (paso por valor): " << a << endl;    cout << "Valor inicial de b (paso por referencia): " << b << endl;    cout << "Valor inicial de c (paso por puntero): " << c << endl;
	cout << "\nLlamando a modificarPorValor(a)..." << endl;    modificarPorValor(a);    cout << "Después de modificarPorValor, valor de a: " << a << endl;
	cout << "\nLlamando a modificarPorReferencia(b)..." << endl;    modificarPorReferencia(b);    cout << "Después de modificarPorReferencia, valor de b: " << b << endl;
	cout << "\nLlamando a modificarPorPuntero(&c)..." << endl;    modificarPorPuntero(&c);    cout << "Después de modificarPorPuntero, valor de c: " << c << endl;
	return 0;
}
```

- ¿Qué diferencias observas en el comportamiento de a, b y c tras cada llamada?
el valor de a se modifica dentro de la función pero cuando volvemos a la variable original tenemos nuevamente el valor original, no se almacena un nuevo valor, mientras que en b y en c si se guarda un nuevo valor al salir de la función

- ¿Por qué ocurre esta diferencia?
en a el valor original no cambia porqur al entrar a la función se está creando una copia de la variable original que se modifica solo mientras está dentro de la función, en b se utiiza una referencia ala variable original que modificará su valor y en c se ua un puntero, usando un operador de direccion se cambia el contenido 

### Notas sobre la unidad 
**Paso por Valor:**

La función recibe una copia del valor. Las modificaciones realizadas dentro de la función no afectan a la variable original. En este ejemplo, a sigue siendo 10 después de la llamada a modificarPorValor.

**Paso por Referencia (con referencias):**

La función recibe una referencia (alias) a la variable original. Las modificaciones realizadas dentro de la función afectan a la variable original. En el ejemplo, b se convierte en 15 después de la llamada a modificarPorReferencia.

**Paso por Puntero:**

La función recibe la dirección de la variable original. Accediendo al valor mediante la indirección (`*`), se puede modificar el contenido de la variable original. Así, c se convierte en 15 después de la llamada a modificarPorPuntero.

```cpp
#include <iostream>
using namespace std;

// Función que modifica el parámetro pasado por valor
void modificarPorValor(int n) {
	cout << "Dentro de modificarPorValor, valor inicial: " << n << endl;
	n += 5;
	cout << "Dentro de modificarPorValor, valor modificado: " << n << endl;
}

// Función que modifica el parámetro pasado por referencia
void modificarPorReferencia(int& n) {
	cout << "Dentro de modificarPorReferencia, valor inicial: " << n << endl;
	n += 5;
	cout << "Dentro de modificarPorReferencia, valor modificado: " << n << endl;
}

// Función que modifica el parámetro utilizando punteros
void modificarPorPuntero(int* n) {
	cout << "Dentro de modificarPorPuntero, valor inicial: " << *n << endl;
	*n += 5;
	cout << "Dentro de modificarPorPuntero, valor modificado: " << *n << endl;
}

void swapPorValor(int a, int b) {
	cout << "Dentro de modificarPorValor, valor inicial de a: " << a << endl;
	cout << "Dentro de modificarPorValor, valor inicial de b: " << b << endl; 
	int temp = a;
	a = b;
	b = temp;
	cout << "Dentro de modificarPorValor, valor modificado de a: " << a << endl;
	cout << "Dentro de modificarPorValor, valor modificado de b: " << b << endl;
}

int main() {
	int a = 10;    int b = 7;    int c = 1;
	cout << "Valor inicial de a (paso por valor): " << a << endl;    cout << "Valor inicial de b (paso por referencia): " << b << endl;    cout << "Valor inicial de c (paso por puntero): " << c << endl;
	cout << "\nLlamando a modificarPorValor(a)..." << endl;    modificarPorValor(a);    cout << "Después de modificarPorValor, valor de a: " << a << endl;
	cout << "\nLlamando a modificarPorReferencia(b)..." << endl;    modificarPorReferencia(b);    cout << "Después de modificarPorReferencia, valor de b: " << b << endl;
	cout << "\nLlamando a modificarPorPuntero(&c)..." << endl;    modificarPorPuntero(&c);    cout << "Después de modificarPorPuntero, valor de c: " << c << endl;
	cout << "\nLlamando a swapPorValor " << endl; swapPorValor(a, b); cout << "Después de swapPorValor, valor de a:" << a << endl; cout << "Después de swapPorValor, valor de b:" << b << endl;
	return 0;
}
```

swap por valor 
```cpp
void swapPorValor(int a, int b) {
	cout << "Dentro de modificarPorValor, valor inicial de a: " << a << endl;
	cout << "Dentro de modificarPorValor, valor inicial de b: " << b << endl; 
	int temp = a;
	a = b;
	b = temp;
	cout << "Dentro de modificarPorValor, valor modificado de a: " << a << endl;
	cout << "Dentro de modificarPorValor, valor modificado de b: " << b << endl;
}
```