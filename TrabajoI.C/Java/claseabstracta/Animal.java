package claseabstracta;

public class Animal extends Elemento {
    int edad;
    String nombre;

    // Constructor sin parámetros
    Animal() {
        nombre = "Animal desconocido";
        edad = 0;
    }

    // Constructor con un parámetro
    Animal(String nombre) {
        this.nombre = nombre;
        this.edad = 0;
    }

    // Constructor con dos parámetros
    Animal(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    @Override
    void mostrarInfo() {
        System.out.println("Animal: " + nombre + ", Edad: " + edad);
    }
}
