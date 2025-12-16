package claseabstracta;


public class Ciudad extends Elemento {
    String nombre;
    Ciudad() {  // Constructor sin parámetros
        nombre = "Ciudad desconocida";
    }

    @Override
    void mostrarInfo() {
        System.out.println("Ciudad: " + nombre);
    }
}