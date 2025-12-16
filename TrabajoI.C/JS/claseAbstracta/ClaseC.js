class ClaseC extends Figura {
    constructor(nombre, tamaño) {
        super();

        if (nombre && tamaño) {
            this.nombre = nombre;
            this.tamaño = tamaño;
            console.log(`C sobrecargado → nombre y tamaño: ${nombre}, ${tamaño}`);
        } else if (nombre) {
            this.nombre = nombre;
            console.log(`C sobrecargado → solo nombre: ${nombre}`);
        } else {
            console.log("C sobrecargado → sin valores");
        }
    }

    dibujar() {
        console.log("Dibujando C");
    }
}