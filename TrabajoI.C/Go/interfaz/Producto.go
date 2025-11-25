type Producto struct {
    Nombre string
    Precio float64
}

// Constructor copia
func NewProductoCopy(p *Producto) *Producto {
    return &Producto{Nombre: p.Nombre, Precio: p.Precio}
}