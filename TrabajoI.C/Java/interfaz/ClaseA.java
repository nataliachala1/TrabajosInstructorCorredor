package interfaz;

public class ClaseA implements Operable {
    public ClaseA() {  // Constructor sin parámetros
        System.out.println("Constructor sin parámetros en A");
    }

    @Override
    public void operar() {
        System.out.println("Operando en A");
    }
}
