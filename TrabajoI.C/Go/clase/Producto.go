type Producto struct {
	Nombre  string
	Precio  float64
	Cantidad int
}

// Sin parámetros
func NewProducto() *Producto {
	return &Producto{}
}