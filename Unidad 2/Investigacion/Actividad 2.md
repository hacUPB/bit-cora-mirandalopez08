## Pintar una linea completa de negro 
![alt text](../Imagenes/lineaNegra.png)

Código en csharp
```
using System;

class Program
{
    static void Main()
    {
        Console.Clear();
        Console.SetCursorPosition(0, 0);

        for (int i = 0; i < 3; i++)
        {
            Console.Write("█");
        }

        Console.ReadKey();
    }
}
```
