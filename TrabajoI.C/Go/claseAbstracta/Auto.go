type Auto struct {
	entidadBase
	Marca  string
	Modelo string
}

// Constructor sin parámetros
func NewAuto() *Auto {
	return &Auto{entidadBase: newEntidadBase(0)}
}

func (a *Auto) Info() string {
	return "Auto: " + a.Marca + " " + a.Modelo
}