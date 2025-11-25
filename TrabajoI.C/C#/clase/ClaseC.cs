public class C : Figura
{
    private string nombre;
    private int edad;

    public C(string nombre)
    {
        this.nombre = nombre;
        Console.WriteLine($"C sobrecargado (solo nombre): {nombre}");
    }

    public C(string nombre, int edad)
    {
        this.nombre = nombre;
        this.edad = edad;
        Console.WriteLine($"C sobrecargado (nombre + edad): {nombre}, {edad}");
    }

    public override void Dibujar()
    {
        Console.WriteLine("Dibujando C");
    }
}
