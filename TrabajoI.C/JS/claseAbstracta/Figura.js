class Figura {
    constructor() {
        if (new.target === Figura) {
            throw new Error("No se puede instanciar una clase abstracta");
        }
    }

    // Método abstracto
    dibujar() {
        throw new Error("El método 'dibujar()' debe ser implementado por la subclase");
    }
}