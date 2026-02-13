# Actividad 1

### Escribe un programa que dibuje un punto negro en la esquina superior izquierda de la pantalla. (Recuerda que la esquina superior izquierda corresponde al primer bit del primer word en la dirección SCREEN).

### Traduce este programa a lenguaje C++ para que relaciones cómo los conceptos de alto nivel se traducen a bajo nivel.

## Pintar 3 pixeles del mismo registro, código 2
![alt text](../Imagenes/pintar3pxls.png)

Código en C sharp

```
namespace SComputacionales
{
    internal class Program
    {
        static void Main()
        {
            Console.Clear();
            Console.SetCursorPosition(0, 0);
            Console.Write("█");  // Simula un pixel negro

            Console.ReadKey();
        }
    }
}
```
