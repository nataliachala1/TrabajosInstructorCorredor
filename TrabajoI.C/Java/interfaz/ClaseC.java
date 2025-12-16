package interfaz;

public class ClaseC implements Operable {
    String nombre;
    int edad;

    public ClaseC(String nombre) {   // Constructor 1
        this.nombre = nombre;
        System.out.println("Constructor sobrecargado 1 en C: " + nombre);
    }

    public ClaseC(String nombre, int edad) { // Constructor 2
        this.nombre = nombre;
        this.edad = edad;
        System.out.println("Constructor sobrecargado 2 en C: " + nombre + ", " + edad);
    }

    @Override
    public void operar() {
        System.out.println("Operando en C");
    }
}
