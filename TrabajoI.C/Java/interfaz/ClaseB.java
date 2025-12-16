package interfaz;

public class ClaseB implements Operable {
    int valor;

    public ClaseB(int valor) {  // Constructor con parámetros
        this.valor = valor;
        System.out.println("Constructor con parámetros en B: " + valor);
    }

    @Override
    public void operar() {
        System.out.println("Operando en B");
    }
}
