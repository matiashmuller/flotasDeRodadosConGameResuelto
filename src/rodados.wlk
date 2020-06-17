import wollok.game.*


class ChevroletCorsa {
	var property image = "autitorojo.png"
	var property position 
	const property posicionesVisitadas = #{}
	
	method capacidad() { return 4 }
	method velocidadMaxima() { return 150 }
	method peso() { return 1300 }
	
	method cambiarPosicion(pos) {
		 self.position(pos)
		 posicionesVisitadas.add(pos)
	}
	
	method pasoPor(unaPosicion) { return posicionesVisitadas.contains(unaPosicion) }
	
	method posicionesVisitadasX() { return posicionesVisitadas.map({ pos => pos.x() }) }

	method pasoPorColumna(col) { return self.posicionesVisitadasX().contains(col) }
	
	method recorrioColumnas(lista_de_numeros) { return lista_de_numeros.all({ col => self.pasoPorColumna(col) }) }
	

	method moverDerecha() { self.cambiarPosicion(self.position().right(1)) }
	method moverIzquierda() { self.cambiarPosicion(self.position().left(1)) }
	method moverArriba() { self.cambiarPosicion(self.position().up(1)) }
	method moverAbajo() { self.cambiarPosicion(self.position().down(1)) }
	
}


class RenaultKwid {
	var property tanqueAdicional = false
	
	method capacidad() { return if (not tanqueAdicional) {4} else {3} }
	method velocidadMaxima() { return if (not tanqueAdicional) {110} else {120} }
	method peso() { return if (not tanqueAdicional) {1200} else {1350} }
	method color() { return "Azul" }
}


class AutoEspecial {
	var property capacidad
	var property velocidadMaxima
	var property peso
	var property color
}


object trafic {
	var property motor = motorBataton
	var property interior = interiorPopular
	
	method capacidad() { return interior.capacidad() }
	method velocidadMaxima() { return motor.velocidadMaxima() }
	method peso() { return interior.peso() + motor.peso() + 4000 }
	method color() { return "Blanco" }
}

object interiorComodo {
	method capacidad() { return 5 }
	method peso() { return 700 }
}

object interiorPopular {
	method capacidad() { return 12 }
	method peso() { return 1000 }
}

object motorPulenta {
	method peso() { return 800 }
	method velocidadMaxima() { return 130 }
}

object motorBataton {
	method peso() { return 500 }
	method velocidadMaxima() { return 80 }
}




