# Actividad 4

Modificar el código de la actividad 2 para cambiar las propiedades visuales y funcionales del gusano, el video de evidencia en donde se podrá evidenciar el nuevo funcionamiento de la serpiente será el siguiente: [video de evidencia](https://youtu.be/4JrXL_yaUxY?si=aT-wbmmg-OHdPwSU)

El código cumple con el cuidado de la memoria pues se utiliza new para crear nuevos nodos en el enqueue y delete para eliminarlos.

## ofApp.cpp

```cpp
#include "ofApp.h"
//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
	for (int i = 0; i < 50; i++) {
		strokes.enqueue(ofGetWidth() / 2, ofGetHeight() / 2, 20, (250, 20), 2);
	}
}
//--------------------------------------------------------------
void ofApp::update() {
	backgroundHue += 0.2;
	if (backgroundHue > 255)
		backgroundHue = 0;

	if (ofGetMousePressed()) {
		float X = ofGetMouseX(); // tomar las posiciones del mouse para determinar la posicion de los nodos
		float Y = ofGetMouseY();

		float radius = ofRandom(5, 25); // tamaño/radio random

		ofColor color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255)); // colores random

		float opacity = ofRandom(50, 200);

		strokes.enqueue(X, Y, radius, color, opacity);
	}
	backgroundHue = fmod(backgroundHue + 0.1, 255);
}
//--------------------------------------------------------------
void ofApp::draw() {
	ofColor color1 = ofColor::fromHsb(backgroundHue, 150, 240);
	ofColor color2 = ofColor::fromHsb(fmod(backgroundHue + 128, 255), 150, 240);
	ofBackgroundGradient(color1, color2, OF_GRADIENT_LINEAR);

	if (strokes.front == nullptr)
		return;
	ofMesh mesh;
	mesh.setMode(OF_PRIMITIVE_LINE_STRIP);
	Node * current = strokes.front;
	int index = 0;
	while (current) {
		float hue = ofMap(index++, 0, strokes.size - 1, 0, 255);
		mesh.addColor(ofColor::fromHsb(hue, 200, 255));
		mesh.addVertex(glm::vec3(current->x, current->y, 0.0f));
		current = current->next;
	}
	ofSetLineWidth(2);
	mesh.draw();
	// Círculos con tamaño y color variable
	current = strokes.front;
	index = 0;
	ofFill();
	ofSetLineWidth(2);
	while (current) {

		ofColor c = current->color;
		c.a = current->opacity;

		ofSetColor(c);

		ofDrawCircle(current->x, current->y, current->radius);

		current = current->next;
	}
}
//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'c') {
		strokes.clear();
	}
	if (key == 'a') {

		if (strokes.maxSize == 50) {
			strokes.maxSize = 100;
		} else {
			strokes.maxSize = 50;
		}

		// eliminar nodos sobrantes usando dequeue
		while (strokes.size > strokes.maxSize) {
			strokes.dequeue();
		}
	}

	// TODO: alternar entre 50 y 100 trazos.
	else if (key == 's') {
		ofSaveFrame();    
		// TODO: guardar el frame actual.
	}
}

// Implementa aquí `enqueue()`
void BrushQueue::enqueue(float x, float y, float radius, ofColor color, float opacity) {

	Node * newNode = new Node(x, y, radius, color, opacity);

	if (rear == nullptr) {
		front = rear = newNode;
	} else {
		rear->next = newNode;
		rear = newNode;
	}

	size++;

	if (size > maxSize) {
		dequeue();
	}
}

void BrushQueue::dequeue() {

	if (isEmpty())
		return;

	Node * temp = front;
	front = front->next;

	if (front == nullptr) {
		rear = nullptr;
	}

	delete temp;
	size--;
}
// Implementa aquí `clear()`
void BrushQueue::clear() {

	while (!isEmpty()) {
		dequeue();
	}
}
// Implementa aquí `isEmpty()`
bool BrushQueue::isEmpty() {

	return front == nullptr;
}

```

## ofApp.h

```cpp
#pragma once
#include "ofMain.h"
// Nodo de la cola
struct Node {
	float x, y;
	float radius;
	ofColor color;
	float opacity;
	Node * next;
	Node(float _x, float _y, float _radius, ofColor _color, float _opacity)
		: x(_x)
		, y(_y)
		, radius(_radius)
		, color(_color)
		, opacity(_opacity)
		, next(nullptr) { }
};
// Implementación manual de una cola (FIFO)
class BrushQueue {
public:
	Node * front;
	Node * rear;
	int size;
	int maxSize;
	BrushQueue(int _maxSize);
	~BrushQueue();
	void enqueue(float x, float y, float radius, ofColor color, float opacity);
	void dequeue();
	void clear();
	bool isEmpty();
};

// Constructor
BrushQueue::BrushQueue(int _maxSize)
	: front(nullptr)
	, rear(nullptr)
	, size(0)
	, maxSize(_maxSize) { }
// Destructor
BrushQueue::~BrushQueue() {
	clear();
}

class ofApp : public ofBaseApp {
public: 
	BrushQueue strokes; // Cola de trazos
	float backgroundHue = 0;
	ofApp()
		: strokes(50) { } // Tamaño máximo de la cola
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
};

```