type entidadBase struct {
	ID int
}

// Constructor privado (abstracto)
func newEntidadBase(id int) entidadBase {
	return entidadBase{ID: id}
}
