package claseabstracta;

public class Producto extends Elemento {
    String name;
    double precio;
    private String nombre;

    Producto(String nombre, double precio) {   // Constructor con parámetros
        this.nombre = nombre;
        this.precio = precio;
    }

    @Override
    void mostrarInfo() {
        System.out.println("Producto: " + nombre + ", Precio: $" + precio);
    }
}