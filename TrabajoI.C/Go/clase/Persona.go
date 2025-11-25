package main

type Persona struct {
	Nombre string
	Edad   int
}

// Constructor copia
func NewPersonaCopy(p *Persona) *Persona {
	return &Persona{Nombre: p.Nombre, Edad: p.Edad}
}
