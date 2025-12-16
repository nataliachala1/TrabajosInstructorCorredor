public class E : Figura
{
    private double precio;

    public E(double precio)
    {
        this.precio = precio;
        Console.WriteLine($"Constructor con parámetros en E: {precio}");
    }

    public override void Dibujar()
    {
        Console.WriteLine("Dibujando E");
    }
}
