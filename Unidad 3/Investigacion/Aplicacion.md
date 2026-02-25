# Actividad 6
**1. ¿Cuál es la diferencia entre un constructor y un destructor en C++?**
Es como el ciclo de vida de un objeto. El Constructor es el que 'da a luz' al objeto; en el código se ejecuta apenas creamos a p para darle los valores de 10 y 20. El Destructor es el que hace la limpieza, borara la información que se había almacenado previamente. 

**2. ¿Cuál es la diferencia entre un objeto y una clase en C++?**
La *Clase* es el plano, molde o plantilla. Define qué datos tendrá el objeto y qué acciones puede realizar, pero no ocupa espacio real en memoria para datos específicos. Un *Objeto*: Es la instancia de la clase. Este si guarda información por lo que ocupa un espacio real en la memoria

**3. ¿Qué diferencia notas entre el objeto Punto en C++ y C#?**
En C++, cuando puse Punto p(10, 20), el objeto se creó de una vez ahí donde estaba. En C#, tuve que usar new. Sin el new, p no es nada. Esto pasa porque en C# los objetos siempre se guardan en el Heap

**4. ¿Qué es `p` en C++ y qué es `p` en C#? (en uno de ellos `p` es un objeto y en el otro es una referencia a un objeto).**
En C++, p ES el objeto. Si tú tocas a p, estás tocando directamente los datos de x e y.
En C#, p es una referencia. Es como si p fuera un papelito que tiene anotada la dirección de dónde vive el objeto realmente

**5. ¿En qué parte de memoria se almacena `p` en C++ y en C#?**
En C++, p se almacena en el Stack. En C#, la variable p está en el Stack, pero el objeto Punto con sus datos vive en el Heap.

**6. ¿Qué observaste con el depurador acerca de `p`? Según lo que observaste ¿Qué es un objeto en C++?**
Al inspeccionar p con el depurador, noté que en C++ p es simplemente un bloque de memoria que guarda dos números enteros (x e y).
Esto me enseñó que un objeto en C++ es básicamente un pedazo de memoria con un tamaño fijo. 