public class ClaseB : IOperable
{
    private int valor;

    public B(int valor)  // Constructor con parámetros
    {
        this.valor = valor;
        Console.WriteLine($"Constructor con parámetros en B: {valor}");
    }

    public void Operar()
    {
        Console.WriteLine("Operando en B");
    }
}
