public class B : Figura
{
    private int valor;

    public B(int valor)
    {
        this.valor = valor;
        Console.WriteLine($"Constructor con parámetros en B: {valor}");
    }

    public override void Dibujar()
    {
        Console.WriteLine("Dibujando B");
    }
}
