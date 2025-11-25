type Persona struct {
    Nombre string
    Edad   int
}

// Constructor sin parámetros
func NewPersona() *Persona {
    return &Persona{}
}

// Constructor con parámetros
func NewPersonaWithParams(nombre string, edad int) *Persona {
    return &Persona{Nombre: nombre, Edad: edad}
}

// Constructor "sobrecargado"
func NewPersonaAdult(nombre string) *Persona {
    return &Persona{Nombre: nombre, Edad: 18}
}

// Constructor copia
func NewPersonaCopy(p *Persona) *Persona {
    return &Persona{Nombre: p.Nombre, Edad: p.Edad}
}

// Implementación de la interfaz
func (p *Persona) Info() string {
    return "Persona: " + p.Nombre
}
