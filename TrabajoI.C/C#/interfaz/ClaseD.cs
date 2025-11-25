public class ClaseD : IOperable
{
    public int Numero { get; set; }

    public D(int numero)  // Constructor normal
    {
        Numero = numero;
        Console.WriteLine($"Constructor normal en D: {numero}");
    }

    public D(D original)  // Constructor copia
    {
        Numero = original.Numero;
        Console.WriteLine($"Constructor copia en D: {Numero}");
    }

    public void Operar()
    {
        Console.WriteLine("Operando en D");
    }
}
