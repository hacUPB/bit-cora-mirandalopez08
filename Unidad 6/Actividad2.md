# Actividad 1

## 1. Identifica los Roles:

¿Qué clase actúa como la interfaz `Observer`? ¿Qué método define?
``` cpp
    class Observer {
public:
	virtual ~Observer() = default;
	virtual void onNotify(const std::string& event) = 0;
};
```
¿Qué clase actúa como `Subject`? ¿Qué métodos proporciona para gestionar observadores y notificar?

```cpp
class Subject {
public:
	void addObserver(Observer* observer);
	void removeObserver(Observer* observer);
protected:
	void notify(const std::string& event);
private:
	std::vector<Observer*> observers;
};
```

¿Qué clase es el `ConcreteSubject` en esta aplicación? ¿Por qué? (Pista: ¿Quién *envía* las notificaciones?)
¿Qué clase(s) actúan como `ConcreteObserver`? ¿Por qué? (Pista: ¿Quién *recibe* y *reacciona* a las notificaciones?)

ConcreteSubject: 
```cpp
class Particle : public Observer {
public:
	Particle();
	~Particle() override;
	Particle(const Particle&) = delete;
	Particle& operator=(const Particle&) = delete;
	void update();  void draw();
	void onNotify(const std::string& event) override;
	void setState(State* newState);
	ofVec2f position;
	ofVec2f velocity;
	float size;
	ofColor color;
private:
	void keepInsideWindow();
	State* state;
};
```

ConcreteObserver: 

## 2. Sigue el flujo de notificación:
- Localiza el método `keyPressed` en `ofApp.cpp`. ¿Qué sucede cuando se presiona la tecla ‘a’? ¿Qué método se llama?

	Se llama el método attractState

	```cpp
	void AttractState::update(Particle* particle) {
	ofVec2f mouse(ofGetMouseX(), ofGetMouseY());
	steer(particle, mouse, /*accel*/ 0.05f, /*vmax*/ 3.0f, /*posScale*/ 0.2f);
	```

- Ve al método `notify` en la clase `Subject`. ¿Qué hace este método?

	El método notify va a recorrer la lista de observers que tiene y a todos les notificará con el on notify 
```cpp
	void Subject::notify(const std::string& event) {
	for (Observer* observer : observers) {
		observer->onNotify(event);
	}
}
```

- Localiza el método que implementa la interfaz `Observer` en la clase `Particle` (`onNotify`). ¿Qué hace este método cuando recibe el evento “attract”?

El on notify revisará que evento está recibiendo, y creará una instancia de objeto de los eventos creados
```cpp
	void Particle::onNotify(const std::string& event) {
	if (event == "attract") {
		setState(new AttractState());
	}
	else if (event == "repel") {
		setState(new RepelState());
	}
	else if (event == "stop") {
		setState(new StopState());
	}
	else if (event == "normal") {
		setState(new NormalState());
	}
}
```

En este caso si llega attract básicamente creará una instancia nueva de el método AttractState y las párticulas seguirán este comportamiento específico, en este caso se atraen hacia el mouse

```cpp
void AttractState::update(Particle* particle) {
	ofVec2f mouse(ofGetMouseX(), ofGetMouseY());
	steer(particle, mouse, /*accel*/ 0.05f, /*vmax*/ 3.0f, /*posScale*/ 0.2f);
```

## 3. Registro y eliminación de observadores:
- ¿En qué parte del código se añaden las instancias de `Particle` como observadores de `ofApp`? (Busca dónde se llama a `addObserver`).

Las instancias de particles añadidas como observadores se agregan en el setup, se crea un for que recorrerá todo el arreglo de particulas por cada tipo de particulas, la ultima linea `addObserver(p)` va a ser la que los añada como observadores, sin esta el on notify nunca ocurriría en el código y las particulas no cambiarían su estado.

```cpp
void ofApp::setup() {
	ofBackground(0);
	particles.reserve(100 + 5 + 10);
	for (int i = 0; i < 100; ++i) {
		Particle* p = ParticleFactory::createParticle("star");
		particles.push_back(p);
		addObserver(p);
	}
	for (int i = 0; i < 5; ++i) {
		Particle* p = ParticleFactory::createParticle("shooting_star");
		particles.push_back(p);
		addObserver(p);
	}
	for (int i = 0; i < 10; ++i) {
		Particle* p = ParticleFactory::createParticle("planet");
		particles.push_back(p);
		//addObserver(p);
	}
}
```
- Aunque no se usa explícitamente en este ejemplo simple, ¿Dónde se eliminarían los observadores si fuera necesario (por ejemplo, si una partícula se destruyera durante la ejecución)? (Busca `removeObserver`). ¿Por qué es importante el destructor de `ofApp` en este contexto?
```cpp
ofApp::~ofApp() {
	for (Particle* p : particles) {
		removeObserver(p);
		delete p;
	}
	particles.clear();
}
```

Al crear nuevas instancias de particulas cada que se llama un método es importante destruirlas para cuidar la memoria

