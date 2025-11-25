public class ClaseE : IOperable
{
    private double precio;

    public E(double precio)  // Tipo repetido
    {
        this.precio = precio;
        Console.WriteLine($"Constructor con parámetros en E: {precio}");
    }

    public void Operar()
    {
        Console.WriteLine("Operando en E");
    }
}
