class Pedido {
	var property distanciaARecorrer
	var property tiempoMaximo
	var property cantidadPasajeros
	var property coloresIncompatibles =#{}
	
	method velocidadRequerida() { return distanciaARecorrer / tiempoMaximo }

	method satisfacePedido(auto) {
		return (auto.velocidadMaxima() > self.velocidadRequerida() + 10)
			and auto.capacidad() >= cantidadPasajeros 
			and not coloresIncompatibles.contains(auto.color())
	}

	method acelerar() { tiempoMaximo -= 1 }
	method relajar() { tiempoMaximo += 1 }

}
