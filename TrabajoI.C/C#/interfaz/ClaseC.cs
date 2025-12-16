public class ClaseC : IOperable
{
    private string nombre;
    private int edad;

    public C(string nombre)  // Versión 1
    {
        this.nombre = nombre;
        Console.WriteLine($"C sobrecargado (solo nombre): {nombre}");
    }

    public C(string nombre, int edad)  // Versión 2
    {
        this.nombre = nombre;
        this.edad = edad;
        Console.WriteLine($"C sobrecargado (nombre + edad): {nombre}, {edad}");
    }

    public void Operar()
    {
        Console.WriteLine("Operando en C");
    }
}
