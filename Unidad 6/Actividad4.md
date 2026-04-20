# Actividad 4
## 1. Identifica los componentes:
**¿Cuál es la clase Context? ¿Qué miembro utiliza para mantener el estado actual?**

La clase Context es Particle, ya que mantiene una referencia al estado actual mediante el atributo State * state, delega su comportamiento al estado en el método update() y permite cambiar de estado mediante setState(). *Revisar esto*

**¿Cuál es la interfaz State? ¿Qué métodos importantes define? (Piensa en update, onEnter, onExit).**
```cpp
class State {
public:  
		virtual ~State() = default;  
		virtual void update(Particle * particle) = 0;  
		virtual void onEnter(Particle * particle) { }  
		virtual void onExit(Particle * particle) { }
		};
```

**Enumera las clases ConcreteState. ¿Qué comportamiento específico encapsula cada una?** 
```cpp
class NormalState : public State {
public:
	void update(Particle* particle) override;
	void onEnter(Particle* particle) override;
};

class AttractState : public State {
public:
	void update(Particle* particle) override;
};

class RepelState : public State {
public:
	void update(Particle* particle) override;
};

class StopState : public State {
public:
	void update(Particle* particle) override;
```
Cada clase representa los distintos eventos que suceden cuando se presiona una tecla específica. En este caso: "s", "a", "r" o "n", respectivamente. Los métodos que fueron creados en la clase base State, ahora se "sobrescriben" por los update de cada clase. En otras palabras cuando se toca una tecla el estado que esta relacionado con dicha tecla se actuaiza. El método onEnter solo funciona con el estado normal, puesto que es el estado en el que inicia.

## 2. Delegación del comportamiento:

**Observa el método Particle::update(). ¿Cómo delega la lógica de actualización al estado actual?**

```cpp
void Particle::update() {
	if (state) {
		state->update(this);
	}
```
El this es la particula que ya esta "seleccionada" y el update quiere decir que se actualiza al estado de esa partícula.

**Compara el código dentro de NormalState::update(), AttractState::update(), RepelState::update() y StopState::update(). ¿Cómo encapsula cada clase un comportamiento diferente?**

- NormalState::update()

particle->position += particle->velocity;

Se suma la posición y velocidad y el movimiento de la particula es "libre."

- AttractState::update()
`
steer(particle, mouse, 0.05f, 3.0f, 0.2f);
`
Calcula dirección hacia el mouse y acelera en esa dirección

- RepelState::update()
`
ofVec2f away = particle->position - mouse;
particle->velocity += away * 0.05f;
`
Calcula dirección opuesta al mouse y se aleja de él (position-mouse)
`
StopState::update()
particle->velocity *= 0.80f;
`
Reduce la velocidad poco a poco hasta que se detiene por completo.

## 3. Transiciones de estado:

**¿Cómo cambia una Particle de un estado a otro? ¿Qué método es responsable de gestionar la transición? (Busca setState).**
    
```cpp
	void setState(State* newState);
```
setState crea un nuevo estado para particle cuando recibe un estado nuevo. Ese estado llega de onNotify cuando sucede un evento, es decir se presiona una tecla:

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
**¿Qué sucede dentro de Particle::setState()? ¿Por qué son importantes los métodos onEnter y onExit de la interfaz State (aunque no todos los estados concretos los usen extensivamente en este ejemplo)? ¿Qué gestionan onEnter y onExit en NormalState?**

Son métodos de contro de memoria, on enter crea el nuevo objeto y on exit elimina en la memoria para que no haya memory leak


**¿Qué evento externo (mediado por el patrón Observer, que ya analizaste) desencadena la llamada a setState en una Particle?** 
Presionar una tecla, al hacer esto se llama esta parte del código que activará el set state para las partículas
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