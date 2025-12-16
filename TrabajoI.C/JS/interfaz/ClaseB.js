class ClaseB {
    constructor(valor) {
        this.valor = valor;
        console.log(`Constructor con parámetros en B → ${valor}`);

        implementarInterfaz(this, InterfazOperable);
    }

    operar() {
        console.log("Operando en B");
    }
}