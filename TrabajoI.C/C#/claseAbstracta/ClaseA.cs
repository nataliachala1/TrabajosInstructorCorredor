public class A : Figura
{
    public A()
    {
        Console.WriteLine("Constructor sin parámetros en A");
    }

    public override void Dibujar()
    {
        Console.WriteLine("Dibujando A");
    }
}
