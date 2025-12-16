package interfaz;

public class ClaseE implements Operable {
    double precio;

    public ClaseE(double precio) { // Constructor con parámetros (repetido)
        this.precio = precio;
        System.out.println("Constructor con parámetros en E: " + precio);
    }

    @Override
    public void operar() {
        System.out.println("Operando en E");
    }
}
