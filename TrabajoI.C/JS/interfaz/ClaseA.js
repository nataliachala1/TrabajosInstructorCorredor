class ClaseA {
    constructor() {
        this.msg = "Constructor sin parámetros en A";
        console.log(this.msg);

        implementarInterfaz(this, InterfazOperable);
    }

    operar() {
        console.log("Operando en A");
    }
}