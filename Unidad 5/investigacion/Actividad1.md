# Unidad 6

## Actividad 1

### Parte 1

**1. ¿Qué es el encapsulamiento para ti? Describe una situación en la que te haya sido útil o donde hayas visto su importancia.**

El encapsulamiento consiste en definir el nivel de protección que tiene un objeto, lo que significa que podemos determinar si será una clase *pública*, a la que todos puedan acceder, *privada* que solo se puedaa acceder dentro de ella, o *protegidas* que se pueda acceder a ellas por medio de herencia. 

Al momento de utilizar variables de una clase padre en las clases hijas es muy util poder modificar la información desde estas sin comprometer la seguridad de las variables creadas.

**2. ¿Qué es la herencia? ¿Por qué un programador decidiría usarla? Da un ejemplo simple.** 

La herencia es una parte de POO que consiste en crear una clase padre o principal que contenga atributos generales que el programador necesite usar en vafias clases, como crear una plantilla que luego podrá ser utilizada en otras clases, lo que significa que los atributos originaes podrán modificarse en cada clase. 

un programador podráia decidir usarla porque es mucho más fácil tener una plantilla para las clases que deben crearse que tener que asignarle sus valores cada que se crea una nueva. 

un ejemplo puede ser crear una clase padre que sea **mascotas** con características como numero de patas, alimentacion, tipo de animal, sonido ... y luego crear clases hijas como gato, perro, hamster, ... y a cada uno asignarle características específicas

**3. ¿Qué es el polimorfismo? Describe con tus palabras qué significa que un código sea “polimórfico”.**

El polimorfismo es la capacidad de una subclase que hereda de una clase más general de responder de forma diferente al mismo método, siguiendo con el ejemplo anterior si tengo la clase mascotas y tengo perro y gato, si creo la función *hacer sonido*, cuando la llame en perro va a hacer *guau* y cuando llame gato va a hacer *miau*

### Parte 2: alaisis del código de csharp

**Encapsulamiento:**

**- Señala una línea de código que sea un ejemplo claro de encapsulamiento y explica por qué lo es.**

**- ¿Por qué crees que el campo nombre es private pero la propiedad Nombre es public? ¿Qué problema se evita con esto?**

```csharp
private string nombre; 
public string Nombre 
{
    get { return nombre; }
    protected set { nombre = value; }
}
```
Inicialmente es una variable privada pues esta es la que almacena el dato real/original, la propiedad Nombre toma el dato original y crea una copia de este mismo al que se puede acceder publicamente y puede ser modificado por todos pero el dato original no va a ser modificado directamente. El get y set se utilizan para crear la copia, get para que cualquiera pueda leerlo pero el set establece que será protegido por lo que solo las clases que lo hereden podrán usarlo

**Herencia:**

**- ¿Cómo se evidencia la herencia en la clase Circulo?**

**- Un objeto de tipo Circulo, además de Radio, ¿Qué otros datos almacena en su interior gracias a la herencia?**

```csharp
public class Circulo : Figura
{
    public double Radio { get; private set; }
    public Circulo(double radio) : base("Círculo")
    {
        this.Radio = radio;
    }
    public override void Dibujar()
    {
        Console.WriteLine($"Dibujando un {Nombre} de radio {Radio}.");
    }
}

```
Desde que se define la clase al poner circulo: figura se está estableciendo una relación de herencia entre ambas. La clase circulo heredará la propiedad de el nombre por lo que al definirla será necesario especificar el nombre, esto se evidencia en `public Circulo(double radio) : base("Círculo")` donde se está llamando en constructor de formas, además también heredará la función de dibujar, que aunque no tiene especificada su función, si podremos definir que hará específicamente en la clase circulo

**Polimorfismo:**

**- Observa el bucle `foreach`. La variable `fig` es de tipo Figura, pero a veces contiene un Circulo y otras un Rectangulo. Cuando se llama a `fig.Dibujar()`, el programa ejecuta la versión correcta. En tu opinión, ¿Cómo crees que funciona esto “por debajo”? No necesitas saber la respuesta correcta, solo quiero que intentes razonar cómo podría ser.**

```csharp
public static void Main()
{
    List<Figura> misFiguras = new List<Figura>();
    misFiguras.Add(new Circulo(5.0));
    misFiguras.Add(new Rectangulo(4.0, 6.0));
    misFiguras.Add(new Circulo(10.0));
    foreach (Figura fig in misFiguras)
    {
        fig.Dibujar();
    }
}
```
Debido que al recorrer el arreglo creado la función dibujar se va a encontrar con las figuras que están definidas, en la posición 0 se encontrará con un circulo, así que irá a la clase circulo, revisará como debe ejecutarse y luego pasará a la siguiente posición del arreglo, que tendrá una figura diferente. 

### Parte 3: hipótesis sobre la implementación

**1. Memoria y herencia: cuando creas un objeto Rectangulo, este tiene Base, Altura y también Nombre. ¿Cómo te imaginas que se organizan esos tres datos en la memoria del computador para formar un solo objeto?**

Se almacenan en un mismo bloque o espacio en la memoria, crreo que estarían uno dentrás de el otro almacenando primero los de figura y luego los de rectángulo, para especificar cuales son parte de la clase padre y cuales son parte de la clase hijo

**2. El mecanismo del polimorfismo: pensemos de nuevo en la llamada fig.Dibujar(). El compilador solo sabe que fig es una Figura. ¿Cómo decide el programa, mientras se está ejecutando, si debe llamar al Dibujar del Circulo o al del Rectangulo? Lanza algunas ideas o hipótesis.**

Como mencioné anteriormente creo que al recorrer el arreglo fig le asignará que objeto hijo se está llamando, dentro del arreglo se están creando nuevas figuras que ya tienen establecidos sus valores por lo que al recorrerlo fig va a tener que tomar la función dibujar y buscar en que figura debe dibujar, y allí tomará la figura especificada en el espacio del arreglo. 

**3. La barrera del encapsulamiento: ¿Cómo crees que el compilador logra que no puedas acceder a un miembro private desde fuera de la clase? ¿Es algo que se revisa cuando escribes el código, o es una protección que existe mientras el programa se ejecuta? ¿Por qué piensas eso?**
Pienso que es una protección que existe desde que se corre el código, inmediatamente el acceso a esta clase se bloquea y no es posible editarla


## Actividad 2
![alt text](image.png)
![alt text](image-1.png)

Básicamente el código crea inicialmente la particula que saldrá desde la mitad de la pantalla, especifica su duración, su movimiento y como acabará, en esta parte se crea la clase `ExplosionParticle` que será la clase padre de 3 subclases que serán: *CircularExplosion, RandomExplosion, StarExplosion*, estas tres clases heredarán las características de `ExplosionParticle` pero también tendrán ciertas especificaciones párticulares de cada clase, todo esto pasa en el **ofApp.h**

Luego en el **ofApp.cpp** el código llama a estas subclases en una función que se llama cuando las partículas deben explotar, también las borrará cuando terminen, se crearán las particulas en la parte inferior con leves variaciones en su posición, se establece un tiempo de vida y un color random

## Actividad 3

Memoria de circular explotion
![alt text](image-7.png)

Muestra en donde está guard

## Actividad 4

Antes de quitar las comentadas si es posible cambiar el valor de las variables
![alt text](image-3.png)

No es posible modificar los valores directamente porque son variables privadas y protegidas por lo que habrá errores de compilacion 
![alt text](image-4.png)

No es posible imprimir los datos aunque se haya hecho una variable pública con el objeto porque la información será privada, por ende no será posible 
![alt text](image-5.png)

Al crear reinterpret es posible crear una referenciación a las posiciones de los objetos y gracias a estas es posible imprimir los datos 
![alt text](image-6.png)

## Actividad 5

**Concepto de herencia**: la herencia es otro concepto fundamental en la programación orientada a objetos. Observa de nuevo en ofApp.h la clase `CircularExplosion`. Observa que esta clase hereda de la clase `ExplosionParticle` que a su vez hereda de la clase `Particle`.

Captura de nuevo la memoria que ocupa el objeto `CircularExplosion` compara la jerarquía de clases con los campos en memoria del objeto. ¿Qué puedes observar? ¿Qué información te proporciona el depurador? ¿Qué puedes concluir?

¿Cómo se implementa la herencia en C++?

C++ permite hacer algo que C# no: herencia múltiple. Realiza un experimento que te permita ver cómo se objeto en memoria cuya clase base tiene herencia múltiple.

## Actividad 6 

**¿Qué puedes observar? ¿Qué información te proporciona el depurador?**

Al ejecutar el bucle y analizarlo con el depurador, se observa que aunque el contenedor almacena punteros de tipo `Particle*`, el método `update(dt)` que se ejecuta no corresponde siempre a la clase base. En su lugar, el flujo del programa entra en la implementación específica de cada clase derivada (por ejemplo, partículas de fuego, humo, etc.). Esto evidencia que la llamada al método se resuelve dinámicamente en tiempo de ejecución según el tipo real del objeto.

El depurador permite ver información relevante como la dirección en memoria del objeto, su tipo dinámico real y, en muchos casos, la presencia de un puntero interno (vptr) que apunta a la tabla de funciones virtuales (vtable). También se puede seguir la traza de ejecución y comprobar que distintas iteraciones del bucle invocan distintas versiones de `update()`. En conjunto, esto demuestra que el comportamiento no depende del tipo del puntero, sino del tipo concreto del objeto al que apunta.


**🧐🧪✍️ Dibujo y explicación del polimorfismo en tiempo de ejecución. ¿Qué puedes concluir?**

El polimorfismo en tiempo de ejecución se puede representar como una estructura donde cada objeto contiene un puntero oculto (vptr) hacia una tabla de funciones virtuales (vtable) propia de su clase. Aunque todos los objetos sean accedidos mediante punteros del mismo tipo base, cada uno mantiene internamente una referencia a su propia vtable, donde están las direcciones de sus métodos sobrescritos.

Cuando se invoca `update(dt)`, el programa no llama directamente a una función fija, sino que primero accede al vptr del objeto, luego a su vtable, y finalmente ejecuta la función correcta según la clase real. La conclusión principal es que el polimorfismo permite desacoplar el código: se puede trabajar con una interfaz común (la clase base) mientras el comportamiento concreto se decide dinámicamente en ejecución. Esto hace el sistema más flexible y extensible.


**🧐🧪✍️ ¿Qué relación existe entre los métodos virtuales y el polimorfismo?**

Los métodos virtuales son el mecanismo fundamental que permite implementar el polimorfismo en tiempo de ejecución en C++. Al declarar un método como `virtual`, se indica al compilador que su resolución no debe hacerse en tiempo de compilación, sino en tiempo de ejecución mediante despacho dinámico. Esto habilita que una misma llamada a función pueda tener múltiples comportamientos dependiendo del tipo real del objeto.

En este sentido, el polimorfismo es el concepto (la capacidad de tener múltiples comportamientos bajo una misma interfaz), mientras que los métodos virtuales son la herramienta que lo hace posible. Sin métodos virtuales, las llamadas a funciones se resolverían estáticamente, eliminando la posibilidad de que diferentes objetos respondan de forma distinta a la misma invocación.
