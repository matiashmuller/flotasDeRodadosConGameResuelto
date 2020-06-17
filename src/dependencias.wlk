import rodados.*
import pedidos.*


class Dependencia {
	
	const property flota = []
	var property cantidadEmpleados
	const property registroPedidos = []
	
	
	method agregarAFlota(rodado) { flota.add(rodado) }
	method quitarDeFlota(rodado) { flota.remove(rodado) }
	method pesoTotalFlota() { return flota.sum({ rod => rod.peso() }) }
	method estaBienEquipada() { return flota.size() >= 3 and flota.all({ rod => rod.velocidadMaxima() >= 100 }) }
	method capacidadTotalEnColor(color) {
		return flota.filter({ rod => rod.color() == color }).sum({ rod => rod.capacidad() })
	}
	method colorDelRodadoMasRapido() { return flota.max({ rod => rod.velocidadMaxima() }).color() }
	
	method capacidadFaltante() { return 0.max(cantidadEmpleados - self.capacidadTotalDeLaFlota()) }
	method capacidadTotalDeLaFlota() { return flota.sum({ rod => rod.capacidad() }) }	
	
	method esGrande() { return cantidadEmpleados >= 40 and flota.size() >= 5 }
	
	
	method agregarPedido(pedido) { registroPedidos.add(pedido) }
	method quitarPedido(pedido) { registroPedidos.remove(pedido) }
	
	method totalDePasajerosEnPedidosRegistrados() {
		return registroPedidos.sum({ ped => ped.cantidadPasajeros() })
	}
	
	method pedidosNoSatisfacibles() {
		return registroPedidos.filter({ ped => not self.tenesAutoPara(ped) })
	}
	method tenesAutoPara(pedido) {
		return flota.any({ auto => pedido.satisfacePedido(auto) })
	}
	
	method esIncompatible(color) { 
		return registroPedidos.all({ ped => ped.coloresIncompatibles().contains(color) })
	}
	
	method relajarPedidos() { registroPedidos.forEach({ ped => ped.relajar() }) }
	
}






