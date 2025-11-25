type Auto struct {
    Marca  string
    Modelo string
}

// Constructor con parámetros
func NewAutoMarca(marca string) *Auto {
    return &Auto{Marca: marca, Modelo: "Genérico"}
}