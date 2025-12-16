public class D : Figura
{
    public int Numero { get; set; }

    public D(int numero)      // Constructor normal
    {
        Numero = numero;
        Console.WriteLine($"Constructor normal en D: {numero}");
    }

    public D(D original)      // Constructor copia
    {
        Numero = original.Numero;
        Console.WriteLine($"Constructor copia en D: {Numero}");
    }

    public override void Dibujar()
    {
        Console.WriteLine("Dibujando D");
    }
}
