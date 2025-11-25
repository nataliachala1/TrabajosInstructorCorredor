class ClaseC {
    constructor(nombre, edad) {
        if (nombre && edad) {
            this.nombre = nombre;
            this.edad = edad;
            console.log(`Constructor sobrecargado: nombre y edad → ${nombre}, ${edad}`);
        } else if (nombre) {
            this.nombre = nombre;
            console.log(`Constructor sobrecargado: solo nombre → ${nombre}`);
        } else {
            console.log("Constructor sobrecargado: sin datos");
        }
    }
}