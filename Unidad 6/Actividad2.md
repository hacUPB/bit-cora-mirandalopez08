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
```cpp


## 2. Sigue el flujo de notificación:
    - Localiza el método `keyPressed` en `ofApp.cpp`. ¿Qué sucede cuando se presiona la tecla ‘a’? ¿Qué método se llama?
    - Ve al método `notify` en la clase `Subject`. ¿Qué hace este método?
    - Localiza el método que implementa la interfaz `Observer` en la clase `Particle` (`onNotify`). ¿Qué hace este método cuando recibe el evento “attract”?
## 3. Registro y eliminación de observadores:
    - ¿En qué parte del código se añaden las instancias de `Particle` como observadores de `ofApp`? (Busca dónde se llama a `addObserver`).
    - Aunque no se usa explícitamente en este ejemplo simple, ¿Dónde se eliminarían los observadores si fuera necesario (por ejemplo, si una partícula se destruyera durante la ejecución)? (Busca `removeObserver`). ¿Por qué es importante el destructor de `ofApp` en este contexto?