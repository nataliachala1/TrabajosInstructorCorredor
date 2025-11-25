type Libro struct {
    Titulo string
    Autor  string
}

// Constructor "sobrecargado"
func NewLibroShort(titulo string) *Libro {
    return &Libro{Titulo: titulo, Autor: "Desconocido"}
}