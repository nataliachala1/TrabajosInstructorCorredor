class D extends Figura {
    constructor(obj) {
        super();

        if (obj instanceof D) {
            // Constructor copia
            this.data = obj.data;
            console.log(`D copia → data: ${this.data}`);
        } else {
            this.data = obj || 0;
            console.log(`D normal → data: ${this.data}`);
        }
    }

    dibujar() {
        console.log("Dibujando D");
    }
}