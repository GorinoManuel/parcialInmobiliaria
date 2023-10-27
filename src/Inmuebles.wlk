
class Inmueble {
	var estado = sinReserva
	const cantAmbiente
	const metrosCuadrados
	const operacionPublicada //No se si usar esto o no
	
	method puedeOperar(unCliente) {
		estado.puedeOperar(unCliente)
	}
}


class Casa inherits Inmueble{
	const valorParticular
	
	method valorInmueble() {
		return valorParticular
	}
}

class PH inherits Inmueble{
	
	
	method valorInmueble() {
		return 500000.min(14000*metrosCuadrados)
	}
}

class Departamento inherits Inmueble{
	
	
	method valorInmueble() {
		return 350000*cantAmbiente
	}
}

object sinReserva {
	
	method puedeOperar(unCliente) {
		return true
	}
}

class Reservado {
	var cliente
	method puedeOperar(unCliente) {
		return cliente == unCliente
	}
}
