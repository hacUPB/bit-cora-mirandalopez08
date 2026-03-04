# Actividad 2

## App.cpp

```cpp
#pragma once
#include "ofMain.h"
class Node { // crear la clase nodo
public: 
	glm::vec2 position; // glm es una biblioteca, se crea el vec2
	Node * next; // se crea una referenciacion a el nodo que apunta al siguiente lugar en la lista
	Node(glm::vec2 pos) // constructor
		: position(pos) // se inicializa position con pos
		, next(nullptr) { } // se crea next que por ahora no tendrá posicion determinada
};
class LinkedList { // lista enlazada
public:
	Node * head; // primer circulo, o la cabeza de la serpiente
	Node * tail; // el ultimo o la cola de la serpiente
	int size; // tamaño es la cantidad de circulos en la serpiente
	LinkedList() // Constructor que empieza vacio
		: head(nullptr)
		, tail(nullptr)
		, size(0) { }
	~LinkedList() { // destructor
		clear();
	}
	void push_back(glm::vec2 pos) { // metodo que agrega nodos al final
		Node * newNode = new Node(pos); //referencia al primer nodo y crea uno nuevo
		if (head == nullptr) { // si en la variable head no hay ningun valor 
			head = tail = newNode; // solo habrá un circulo, la cabeza y la cola serán el mismo valor y por ende seran el nuevo nodo que se cree
		} else { // si si hay un valor en head
			tail->next = newNode; 
			tail = newNode; // a tail se le asigna el siguiente nodo creado 
		}
		size++; // cada que se cumpla el ciclo de aumento el tamaño aumentará también
	}
	void pop_back() { // para disminuir el tamaño
		if (head == nullptr) // si no hay nada en la cabeza no es posible hacer nada pues no hay circulos que eliminar
			return; 
		if (head == tail) { // Si solo hay un elemento
			delete head;
			head = tail = nullptr; // se borran ambos 
		} else { // si hay mas de uno
			Node * temp = head; // va recorriendo la lista hasta llegar a el ultimo (tail)
			while (temp->next != tail) {
				temp = temp->next;
			}
			delete tail; // al lleagr al ultimo se elimina
			tail = temp; // le asigna el valor anterior para que tail no sea nulo
			tail->next = nullptr; // como se borró no hay nex después de la cola
		}
		size--; // disminuye el tamaño
	}
	void clear() { // para eliminar toda la serpiente
		Node * current = head; // comienza desde la cabeza
		while (current != nullptr) { // recorre el arreglo borrando todas las partes de este hasta que llegue a la cola
			Node * nextNode = current->next;
			delete current;
			current = nextNode;
		}
		head = tail = nullptr; // cuando termina head y tail son iguales y ambos son nulos
		size = 0; // el tamaño es 0 porque no hayy circulos
	}
};

class ofApp : public ofBaseApp { // se llaman las funciones de la otra parte del programa
public:
	LinkedList snake;
	float backgroundHue;
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
};

```

## App.h

```cpp
#pragma once
#include "ofMain.h"
class Node { // crear la clase nodo
public: 
	glm::vec2 position; // glm es una biblioteca, se crea el vec2
	Node * next; // se crea una referenciacion a el nodo que apunta al siguiente lugar en la lista
	Node(glm::vec2 pos) // constructor
		: position(pos) // se inicializa position con pos
		, next(nullptr) { } // se crea next que por ahora no tendrá posicion determinada
};
class LinkedList { // lista enlazada
public:
	Node * head; // primer circulo, o la cabeza de la serpiente
	Node * tail; // el ultimo o la cola de la serpiente
	int size; // tamaño es la cantidad de circulos en la serpiente
	LinkedList() // Constructor que empieza vacio
		: head(nullptr)
		, tail(nullptr)
		, size(0) { }
	~LinkedList() { // destructor
		clear();
	}
	void push_back(glm::vec2 pos) { // metodo que agrega nodos al final
		Node * newNode = new Node(pos); //referencia al primer nodo y crea uno nuevo
		if (head == nullptr) { // si en la variable head no hay ningun valor 
			head = tail = newNode; // solo habrá un circulo, la cabeza y la cola serán el mismo valor y por ende seran el nuevo nodo que se cree
		} else { // si si hay un valor en head
			tail->next = newNode; 
			tail = newNode; // a tail se le asigna el siguiente nodo creado 
		}
		size++; // cada que se cumpla el ciclo de aumento el tamaño aumentará también
	}
	void pop_back() { // para disminuir el tamaño
		if (head == nullptr) // si no hay nada en la cabeza no es posible hacer nada pues no hay circulos que eliminar
			return; 
		if (head == tail) { // Si solo hay un elemento
			delete head;
			head = tail = nullptr; // se borran ambos 
		} else { // si hay mas de uno
			Node * temp = head; // va recorriendo la lista hasta llegar a el ultimo (tail)
			while (temp->next != tail) {
				temp = temp->next;
			}
			delete tail; // al lleagr al ultimo se elimina
			tail = temp; // le asigna el valor anterior para que tail no sea nulo
			tail->next = nullptr; // como se borró no hay nex después de la cola
		}
		size--; // disminuye el tamaño
	}
	void clear() { // para eliminar toda la serpiente
		Node * current = head; // comienza desde la cabeza
		while (current != nullptr) { // recorre el arreglo borrando todas las partes de este hasta que llegue a la cola
			Node * nextNode = current->next;
			delete current;
			current = nextNode;
		}
		head = tail = nullptr; // cuando termina head y tail son iguales y ambos son nulos
		size = 0; // el tamaño es 0 porque no hayy circulos
	}
};

class ofApp : public ofBaseApp { // se llaman las funciones de la otra parte del programa
public:
	LinkedList snake;
	float backgroundHue;
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
};

```
