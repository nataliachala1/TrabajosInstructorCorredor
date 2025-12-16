//Clase con constructor sobre cargado

class Persona {
    String name;
    int age;

    public Persona() {
        this.name = "Natalia";
        this.age = 18;
    }

    public Persona(String name) {
        this.name = name;
        this.age = 18;
    }

    public Persona(String name, int age) {
        this.name = name;
        this.age = age;
    }
}