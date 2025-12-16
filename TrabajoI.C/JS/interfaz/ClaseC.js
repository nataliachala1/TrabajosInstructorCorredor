class C {
    constructor(nombre, edad) {
        if (nombre && edad) {
            this.nombre = nombre;
            this.edad = edad;
            console.log(`C sobrecargado → nombre y edad: ${nombre}, ${edad}`);
        } else if (nombre) {
            this.nombre = nombre;
            console.log(`C sobrecargado → solo nombre: ${nombre}`);
        } else {
            console.log("C sobrecargado → sin datos");
        }

        implementarInterfaz(this, InterfazOperable);
    }

    operar() {
        console.log("Operando en C");
    }
}