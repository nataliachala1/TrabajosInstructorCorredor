type Persona struct {
	entidadBase
	Nombre string
	Edad   int
}

// Sobrecargado simulado
func NewPersonaAdult(id int, nombre string) *Persona {
	return &Persona{entidadBase: newEntidadBase(id), Nombre: nombre, Edad: 18}
}

func (p *Persona) Info() string {
	return "Persona: " + p.Nombre
}