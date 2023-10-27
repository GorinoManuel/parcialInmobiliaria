class Venta {
	var porcentaje
	const inmueble
	
	method comision() {
		return inmueble.valorInmueble()*porcentaje/100
	}
}

class Alquiler {
	var mesesPactados
	const inmueble
	
	method comision(){
		return (mesesPactados*inmueble.valorInmueble()) / 50000
	}
}
