//Clase con constructor copia

public class Carro {
    String marca;
    int modelo;

    //Constructor normmal
    public Carro(String marca, int modelo) {
        this.marca = marca;
        this.modelo = modelo;
    }

    //Constructor copia
    public Carro(Carro original) {
        this.marca = original.marca;
        this.modelo = original.modelo;
    }   
}
