## Actividad 7

**OfApp.h:**
```cpp
class SpiralParticle : public Particle {
private:
	glm::vec2 center;
	float angle;
	float radius;
	float angularSpeed;
	float radialSpeed;
	float lifetime;
	float age;
	ofColor color;

public:
	SpiralParticle(const glm::vec2& c)
		: center(c), angle(0), radius(5),
		angularSpeed(ofRandom(2, 5)),
		radialSpeed(ofRandom(20, 40)),
		lifetime(ofRandom(1.5, 3.0)),
		age(0) {
		color.setHsb(ofRandom(255), 200, 255);
	}

	void update(float dt) override {
		angle += angularSpeed * dt;
		radius += radialSpeed * dt;
		age += dt;
	}

	void draw() override {
		glm::vec2 pos = center + glm::vec2(cos(angle), sin(angle)) * radius;
		ofSetColor(color);
		ofDrawCircle(pos, 4);
	}

	bool isDead() const override {
		return age >= lifetime;
	}
};

class FallingParticle : public Particle {
private:
	glm::vec2 position;
	glm::vec2 velocity;
	float age;
	float lifetime;
	ofColor color;

public:
	FallingParticle(const glm::vec2& pos)
		: position(pos),
		velocity(ofRandom(-50, 50), ofRandom(-200, -100)),
		age(0),
		lifetime(ofRandom(2.0, 4.0)) {
		color.setHsb(ofRandom(255), 180, 255);
	}

	void update(float dt) override {
		velocity.y += 9.8f * 50 * dt; // gravedad
		position += velocity * dt;
		age += dt;
	}

	void draw() override {
		ofSetColor(color);
		ofDrawCircle(position, 6);
	}

	bool isDead() const override {
		return age >= lifetime || position.y > ofGetHeight();
	}
};

```

```cpp
class RingExplosion : public ExplosionParticle {
private:
	float expansionRate;

public:
	RingExplosion(const glm::vec2& pos, const ofColor& col)
		: ExplosionParticle(pos, glm::vec2(0, 0), col, 1.2f, 5),
		expansionRate(ofRandom(80, 150)) {
	}

	void update(float dt) override {
		ExplosionParticle::update(dt);
		size += expansionRate * dt; // el radio crece
	}

	void draw() override {
		ofSetColor(color);
		ofNoFill();
		ofDrawCircle(position, size);
		ofFill();
	}
};
```

**OfApp.c:**

```cpp
if (explosionType == 0) {
				particles.push_back(new CircularExplosion(particles[i]->getPosition(), particles[i]->getColor()));
}
else if (explosionType == 1) {
				particles.push_back(new RandomExplosion(particles[i]->getPosition(), particles[i]->getColor()));
}
else if (explosionType == 2) {
				particles.push_back(new StarExplosion(particles[i]->getPosition(), particles[i]->getColor()));
}
else {
				particles.push_back(new RingExplosion(particles[i]->getPosition(), particles[i]->getColor()));
}
``` 

```cpp
void ofApp::keyPressed(int key) {

	// Rising (ya existente)
	if (key == 'r') {
		createRisingParticle();
	}

	// Spiral
	if (key == '1') {
		glm::vec2 pos(ofRandomWidth(), ofRandomHeight());
		particles.push_back(new SpiralParticle(pos));
	}

	// Falling
	if (key == '2') {
		glm::vec2 pos(ofRandomWidth(), 0); // desde arriba
		particles.push_back(new FallingParticle(pos));
	}

	// Muchas partículas (test)
	if (key == ' ') {
		for (int i = 0; i < 100; i++) {
			createRisingParticle();
		}
	}

	// Screenshot
	if (key == 's') {
		ofSaveScreen("screenshot_" + ofToString(ofGetFrameNum()) + ".png");
	}
}
```
2. Patrón Factory

Usé el patrón Factory de forma sencilla en el update(), cuando se crean las explosiones. Dependiendo de un número aleatorio (explosionType), el programa decide qué tipo de explosión crear.

Por ejemplo, puede crear una CircularExplosion, RandomExplosion, etc. Esto hace que la creación de objetos esté en un solo lugar y sea fácil agregar nuevos tipos sin cambiar mucho el código.

```cpp
int explosionType = (int)ofRandom(4);

if (explosionType == 0) {
    particles.push_back(new CircularExplosion(...));
}
else if (explosionType == 1) {
    particles.push_back(new RandomExplosion(...));
}
else if (explosionType == 2) {
    particles.push_back(new StarExplosion(...));
}
else {
    particles.push_back(new RingExplosion(...));
}
```

3. Patrón Observer

No implementé el patrón Observer de forma formal, pero hay una idea parecida. Cada partícula tiene un método shouldExplode() que indica cuándo debe explotar.

El ofApp revisa ese estado en cada frame y, cuando detecta que una partícula debe explotar, crea nuevas partículas. Es como si la partícula “avisara” que cambió de estado y el sistema reacciona.

```cpp
if (particles[i]->shouldExplode())
```

```cpp
bool shouldExplode() const override { return exploded; }
```

4. Patrón State

El patrón State se ve en cómo cambian las partículas internamente. Por ejemplo, en RisingParticle, la partícula empieza subiendo y cuando cumple cierta condición cambia a un estado de “explosión”.

Ese cambio se controla con variables como exploded. Dependiendo de ese estado, el comportamiento cambia (por ejemplo, deja de moverse y genera una explosión). No usé clases separadas para estados, pero la idea del cambio de estado sí está aplicada.
```cpp
bool exploded;
```

```cpp
if (position.y <= explosionThreshold || age >= lifetime) {
    exploded = true;
}
```

```cpp
bool isDead() const override { return exploded; }
```

AL ser buleanos se cambia de true a false