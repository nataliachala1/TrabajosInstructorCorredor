class D {
    constructor(obj) {
        if (obj instanceof D) {
            this.data = obj.data;
            console.log(`Constructor copia en D → data: ${this.data}`);
        } else {
            this.data = obj || 0;
            console.log(`Constructor normal en D → data: ${this.data}`);
        }

        implementarInterfaz(this, InterfazOperable);
    }

    operar() {
        console.log("Operando en D");
    }
}