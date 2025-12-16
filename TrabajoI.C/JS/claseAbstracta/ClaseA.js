class ClaseA extends Figura {
    constructor() {
        super(); // obligatorio
        this.nombre = "Clase A sin parámetros";
        console.log(this.nombre);
    }

    dibujar() {
        console.log("Dibujando A");
    }
}