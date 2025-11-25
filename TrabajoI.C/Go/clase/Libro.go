type Libro struct {
	Titulo string
	Autor  string
	Paginas int
}

// Sobrecargado simulado
func NewLibroShort(titulo, autor string) *Libro {
	return &Libro{Titulo: titulo, Autor: autor, Paginas: 100}
}
