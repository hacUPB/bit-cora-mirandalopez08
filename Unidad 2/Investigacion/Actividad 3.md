Modifica el programa de la actividad anterior de tal manera que puedas mover la línea horizontal de derecha a izquierda usando las teclas d e i respectivamente. Tu programa no tiene que verificar si la línea se sale de la pantalla.

Inicialmente tenemos que encontrar el valor central, en este caso, se calcula de la siguiente manera: 
16384 + (128*32) + 16 = 20496

## Pseudocódigo
RAM [20496] = -1
READ KEYBOARD
if  KBD = 0 
    go to READ KEYBOARD
if KBD = 105 
    RAM[20496] = 0
    RAM[20495] = -1

if KBD = 100 
    RAM[20496] = 0
    RAM[20497] = -1
go to READ KEYBOARD

![alt text](../Imagenes/ia1.png)

intente ayudarme con ia y aunque el codigo si funcionaba no lo entendía tan bien 
![alt text](../Imagenes/ia2.png)

Decidí leer el código y con ayuda de un compañero que me explicó, comprendí los conceptos y cambié algunas partes del código para pode comprenderlo mejor

![alt text](../Imagenes/act3.png)
![alt text](../Imagenes/act3.2.png)

Código en csharp 
```
namespace SComputacionales
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int posicionX = 0;      // posición inicial
            int longitud = 20;      // largo de la línea

            Console.CursorVisible = false;

            while (true)
            {
                Console.Clear();

                // Dibujar línea horizontal
                Console.SetCursorPosition(posicionX, 0);
                for (int i = 0; i < longitud; i++)
                {
                    Console.Write("█");
                }

                // Leer tecla sin mostrarla en pantalla
                ConsoleKeyInfo tecla = Console.ReadKey(true);

                if (tecla.KeyChar == 'd')
                {
                    posicionX++;   // mover derecha
                }
                else if (tecla.KeyChar == 'i')
                {
                    posicionX--;   // mover izquierda
                }
            }
        }
    }
}

```
