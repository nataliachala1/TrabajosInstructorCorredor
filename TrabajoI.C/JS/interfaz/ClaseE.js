class E {
    constructor(precio) {
        this.precio = precio;
        console.log(`Constructor con parámetros en E → precio: ${precio}`);

        implementarInterfaz(this, InterfazOperable);
    }

    operar() {
        console.log("Operando en E");
    }
}