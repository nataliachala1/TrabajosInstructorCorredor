type Producto struct {
	entidadBase
	Nombre string
	Precio float64
}


// Constructor copia
func NewProductoCopy(p *Producto) *Producto {
	return &Producto{entidadBase: newEntidadBase(p.ID), Nombre: p.Nombre, Precio: p.Precio}
}

func (p *Producto) Info() string {
	return "Producto: " + p.Nombre
}
