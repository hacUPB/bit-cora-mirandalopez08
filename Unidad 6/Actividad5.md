El patrón factory lo utilicé en esta parte, se crea la nueva particula y se le asignan sus características, en esta parte solamente se asigna el nombre y la forma en la que se verá, no la cantidad ni el comportamiento

Particle* ParticleFactory::createParticle(const std::string& type)
```cpp
else if (type == "MilkyWay") {
	particle->size = ofRandom (4.0f, 7.0f);
	particle->color = ofColor(112, 0, 23);
}
```

El código completo de esa sección se vería asi: 

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
	else if (type == "MilkyWay") {
		particle->size = ofRandom (4.0f, 7.0f);
		particle->color = ofColor(112, 0, 112);
	}
	return particle;
}
```


En el setup
```cpp
for (int i = 0; i < 20; ++i) {
	Particle* p = ParticleFactory::createParticle("MilkyWay");
	particles.push_back(p);
	addObserver(p);
}
```

