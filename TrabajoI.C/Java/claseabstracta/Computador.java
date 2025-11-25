package claseabstracta;

public class Computador {
    int ram;
    private String nombre;

    // Constructor normal
    Computador(String nombre, int ram) {
        this.nombre = nombre;
        this.ram = ram;
    }

    // Constructor copia
    Computador(Computador otro) {
        this.nombre = otro.nombre;
        this.ram = otro.ram;
    }

    void mostrarInfo() {
        System.out.println("Computador: " + nombre + ", RAM: " + ram + "GB");
    }
}