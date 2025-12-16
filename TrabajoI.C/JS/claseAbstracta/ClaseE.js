class E extends Figura {
    constructor(precio) {
        super();
        this.precio = precio;
        console.log(`E con parámetros → precio: ${precio}`);
    }

    dibujar() {
        console.log("Dibujando E");
    }
}