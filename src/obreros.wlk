import obra.*

class Obrero {
	var property estaDeLicencia = false
	const property obrasQueTrabajo = []
	
	method materialesQueConsume(obra)
	method estaActivo(){ estaDeLicencia = true}
	method estaInactivo(){ estaDeLicencia = false}
	method aporteObra(obra)
	method registrarObra(obra){
		obrasQueTrabajo.add(obra)
	}
	method pasoPor(obra){
		return obrasQueTrabajo.contains(obra)
	}
}

class Albanil inherits Obrero{
	
	override method materialesQueConsume(obra){
		obra.descontarLadrillos(100)
		//obra.ladrillos( obra.ladrillos() - 100 )
	}
	override method aporteObra(obra){
		obra.levantaPared(3)
	}

}

class Gasista inherits Obrero{
	override method materialesQueConsume(obra){ 
		obra.descontarMetrosDeCanio(3)
		obra.descontarFosforos(20) 
	}
	override method aporteObra(obra){
		obra.colocaCaniosDeGas(1)
	}
}

class Plomero inherits Obrero{
	override method materialesQueConsume(obra){
		obra.descontarMetrosDeCanio(10)
		obra.descontarArandelas(30)
	}
	override method aporteObra(obra){
		obra.colocaImplementosDeAgua(0.5)
	}
}

class Electricista inherits Obrero{
	override method materialesQueConsume(obra){
		obra.descontarMetrosDeCable(4)
		obra.descontarCinta(1)
	}
	override method aporteObra(obra){
		obra.colocaCables(4)
	}
}
