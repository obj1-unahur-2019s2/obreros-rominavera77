class Obra {
	var property ladrillos = 0
	var property metrosDeCanio = 0
	var property metrosDeCable = 0
	var property cinta = 0
	var property fosforos = 0
	var property arandelas = 0
	var property efectivo = 0
	var property metrosCuadradosConstruidos = 0
	var property implementosDeAguaColocados = 0
	var property implementosDeGasColocados = 0
	var property cablesElectricosColocados = 0
	const property plantillaDeObreros = #{}

	method habitaciones()	
	method pisos()
	method banios() 
	
	method obraTerninada(){
		return self.construyoLosMetrosAcordados() 
			and self.colocoLosImplementosDeAgua()
			and self.colocoLosImplementosDeGas() 
			and self.colocoLosCablesElectricos()
	}
	
	method construyoLosMetrosAcordados(){
		return self.metrosCuadradosConstruidos() >= 50 * self.habitaciones()
	}
	method colocoLosImplementosDeAgua(){
		return self.implementosDeAguaColocados() >= 10 * self.banios()
	}
	method colocoLosImplementosDeGas(){
		return self.ImplementosDeGasPorBanio() and self.implementosDeGasPorHabitacion()
	}
	method ImplementosDeGasPorBanio(){
		return  self.implementosDeGasColocados() >= 8 * self.banios()
	}
	method implementosDeGasPorHabitacion(){
		return self.implementosDeGasColocados() >= 3 * self.habitaciones()
	}
	method colocoLosCablesElectricos(){
		return self.cablesElectricosPorHabitacion() and self.cablesElectricosPorPiso()
	}
	method cablesElectricosPorHabitacion(){
		return self.cablesElectricosColocados() >= 50 * self.habitaciones()
	}
	method cablesElectricosPorPiso(){
		return self.cablesElectricosColocados() >= 100 * self.pisos()
	}
	
	method agregarObrero(unObrero){
		plantillaDeObreros.add(unObrero)
		unObrero.registrarObra(self)
	}	
	method sacarObrero(unObrero){
		if(not unObrero.estaActivo()){
			self.error( "Las leyes laborales están para respetarse - licencia implica estabilidad laboral")
		}
		plantillaDeObreros.remove(unObrero)
	}

	method obrerosDisponibles(){
		return plantillaDeObreros.filter({
			obrero => not obrero.licencia() and self.estaEnPlantilla(obrero)}) 
	}
	method estaEnPlantilla(obrero){
		
		return plantillaDeObreros.contains(obrero)
	}
	
	method recibirLadrillos(cuanto){ ladrillos += cuanto}
	method recibirCanio(cuanto){ metrosDeCanio += cuanto}
	method recibirCables(cuanto){metrosDeCable+= cuanto}
	method recibirCinta(cuanto){cinta += cuanto}
	method recibirFosforos(cuanto){fosforos += cuanto}
	method recibirArandelas(cuanto){ arandelas += cuanto}
	
	method descontarLadrillos(cuanto){ ladrillos -= cuanto }
	method descontarMetrosDeCanio(cuanto){ metrosDeCanio -= cuanto }
	method descontarMetrosDeCable(cuanto){ metrosDeCable -= cuanto}
	method descontarCinta(cuanto){ 0.min(cinta -= cuanto)}
	method descontarFosforos(cuanto){ fosforos -= cuanto}
	method descontarArandelas(cuanto) { arandelas -= cuanto}
	
	method registrarJornadaLaboral(){
		if(self.noTieneObrerosDesponibles()){
			self.error( "No hay obreros disponibles para trabajar")
		}
		plantillaDeObreros.forEach
			({obrero => obrero.materialesQueConsume(self)
						obrero.aporteObra(self)})
	}
	
	method noTieneObrerosDesponibles(){ 
		return plantillaDeObreros.isEmpty()
	}
	method levantaPared(cuanto){ metrosCuadradosConstruidos += cuanto	}
	method colocaCaniosDeGas(cuanto){	implementosDeGasColocados += cuanto } 
	method colocaImplementosDeAgua(cuanto){ implementosDeAguaColocados += cuanto }
	method colocaCables(cuanto) { metrosDeCable += cuanto}
	
}

class Casa inherits Obra {
	var property habitaciones = 3
	var property banios = 1
	
	override method habitaciones() = habitaciones
	override method banios() = banios
	
	override method pisos() = 1
}

class Edificio inherits Obra {
	var property pisos = 4
	var property departamentos 
	var property ascensores
	
	override method pisos() = pisos

	
}

