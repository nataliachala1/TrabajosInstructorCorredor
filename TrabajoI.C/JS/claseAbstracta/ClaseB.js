class B extends Figura {
    constructor(valor) {
        super();
        this.valor = valor;
        console.log(`Clase B con parámetros → valor: ${valor}`);
    }

    dibujar() {
        console.log("Dibujando B");
    }
}