type CuentaBancaria struct {
	Numero string
	Saldo  float64
}

// Con parámetros
func NewCuentaBancariaWithParams(numero string, saldo float64) *CuentaBancaria {
	return &CuentaBancaria{Numero: numero, Saldo: saldo}
}
