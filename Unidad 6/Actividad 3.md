## 1. Identifica la Factory:
- ¿Qué clase actúa como la factory en este ejemplo?
    
Se llama la clase ParticleFactory, que creará un método que retornará un puntero tipo particle, en el setup cuando se llame se le asignará un nombre por el tipo de particula que se está creando
```cpp 
class ParticleFactory {
public:
	static Particle* createParticle(const std::string& type);
};
```

- ¿Cuál es el “método factory” específico? ¿Es un método de instancia o estático?
El método estático createParticle 

- ¿Qué tipo de objeto devuelve este método fábrica?
Un puntero del tipo particle

## 2. Proceso de creación:
- Observa el método `ParticleFactory::createParticle`. ¿Cómo decide qué tipo de partícula específica crear y configurar?

```cpp
Particle* p = ParticleFactory::createParticle("star");
```

En el setup, con la cadena de caracteres asignada al nombre de la particula, en este caso "star" se estará enviando información del tipo de particula que se creará, esto nos llevará a la función `Particle* ParticleFactory::createParticle(const std::string& type)` que recibirá la cadena de caracteres y determinará el tipo de particula

```cpp
Particle* ParticleFactory::createParticle(const std::string& type) {
	Particle* particle = new Particle();
	if (type == "star") {
		particle->size = ofRandom(2.0f, 4.0f);
		particle->color = ofColor(255, 0, 0);
	}
	else if (type == "shooting_star") {
		particle->size = ofRandom(3.0f, 6.0f);
		particle->color = ofColor(0, 255, 0);
		particle->velocity *= 3.0f;
	}
	else if (type == "planet") {
		particle->size = ofRandom(5.0f, 8.0f);
		particle->color = ofColor(0, 0, 255);
	}
	return particle;
}
```

- ¿Qué información necesita el método fábrica para realizar su trabajo?

La cadena de caracteres o el nombre que define el tipo de particula

- ¿Qué devuelve si se le pasa un tipo desconocido? ¿Cómo podrías mejorar esto?

Devolverá particulas sin tamaño y color que no estarán definidas por tipo 


3. **Uso de Factory:**
- Localiza `ofApp::setup`. ¿Cómo se utiliza la `ParticleFactory` para poblar el vector `particles`?

Utillizando el for que recorrerá n cantidad de veces las funciones que están siendo llamadas, por ejemplo, en el caso de esta sección del código se crearán 100 particulas tipo "star"

```cpp
for (int i = 0; i < 100; ++i) {
	Particle* p = ParticleFactory::createParticle("star");
	particles.push_back(p);
	addObserver(p);
}
```

- Compara esto con la alternativa: ¿Cómo se vería `ofApp::setup` si *no* usara la fábrica y tuviera que crear y configurar cada tipo de partícula (`star`, `shooting_star`, `planet`) directamente usando `new Particle()` y luego ajustando sus propiedades (`size`, `color`, `velocity`)?