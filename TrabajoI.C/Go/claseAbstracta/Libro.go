type Libro struct {
	entidadBase
	Titulo string
	Autor  string
}

// Constructor con parámetros
func NewLibroWithParams(id int, titulo, autor string) *Libro {
	return &Libro{entidadBase: newEntidadBase(id), Titulo: titulo, Autor: autor}
}

func (l *Libro) Info() string {
	return "Libro: " + l.Titulo
}