import Criterios.*
import Operaciones.*

object inmobiliaria {
	var criterio
	const empleados = #{}
	
	method mejorEmpleado(){
		empleados.max { empleado => self.evaluarPorCriterio(empleado)}
	}
	
	method evaluarPorCriterio(unEmpleado) {
		criterio.evaluarA(unEmpleado)
	}
	
}


class Empleado {
	const operacionesCerradas = #{}
	const reservas = #{}
	
	
	method totalComisiones() {
		return operacionesCerradas.sum {operacion => operacion.comision()}
	}
	
	method cantidadOperacionesCerradas() {
		return operacionesCerradas.size()
	}
	
	method cantidadReservas() {
		return reservas.size()
	}
	
	method vaATenerProblemasCon(unEmpleado) {
		return 	self.hizoOperacionesEnZonaDe(unEmpleado.zonas()) and self.algunoChoreoReserva(unEmpleado)
	}
	
	
	method hizoOperacionesEnZonaDe(unasZonas) {
		return not unasZonas.intersection(self.zonas()).isEmpty()
	}
	
	method zonas() {
		return operacionesCerradas.map { operacion => operacion.zona()}.union(reservas.map { reserva => reserva.zona()}) 
	}
	
	method algunoChoreoReserva(unEmpleado) {
		return self.leChoreoA(unEmpleado) || unEmpleado.leChoreoA(self)
	}
	
	method leChoreoA(unEmpleado) {
		return unEmpleado.reservas().any { reserva => self.propiedadesOperadas().contains(reserva.propiedad())}
	}
	
	method propiedadesOperadas() {
		return operacionesCerradas.map { operacion => operacion.propiedad()}
	}
	
	method intentarHacerTrabajo(unCliente, unaPropiedad) {
		self.validarHacerTrabajo(unCliente, unaPropiedad)
		self.trabajar(unCliente, unaPropiedad)
	}
	
	method validarHacerTrabajo(unCliente, unaPropiedad) {
		if(not unaPropiedad.puedeOperar(unCliente)) {
			throw new Exception(message ="No es la misma oersona que reservo")
		}
	}
	
	method trabajar(unCliente, unaPropiedad) {
		//Algo a hacer
	}
}
