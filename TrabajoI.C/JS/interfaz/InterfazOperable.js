const InterfazOperable = {
    operar() {
        throw new Error("La clase debe implementar el método 'operar()'");
    }
};

// Función para validar que la clase implemente la interfaz
function implementarInterfaz(obj, interfaz) {
    for (let metodo of Object.getOwnPropertyNames(interfaz)) {
        if (typeof interfaz[metodo] === "function" && typeof obj[metodo] !== "function") {
            throw new Error(`La clase no implementa el método requerido: ${metodo}`);
        }
    }
}