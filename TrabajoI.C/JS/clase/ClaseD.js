class ClaseD {
    constructor(obj) {
        if (obj instanceof D) {
            // Constructor copia
            this.valor = obj.valor;
            console.log(`Constructor copia en D → valor: ${this.valor}`);
        } else {
            // Constructor normal
            this.valor = obj || 0;
            console.log(`Constructor normal en D → valor: ${this.valor}`);
        }
    }
}