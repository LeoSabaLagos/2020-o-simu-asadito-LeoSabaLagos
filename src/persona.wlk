import elementos.*
import criteriosPasarElementos.*
import criteriosComer.*
import comidas.*

class Persona {
	
	var posicion
	var elementosCercanos = []
	var criterioPasarElemento
	var criterioComer
	var comidasIngeridas = []
	
	method posicion() = posicion
	method elementosCercanos() = elementosCercanos
	method criterioPasarElemento() = criterioPasarElemento
	method criterioComer() = criterioComer
	method comidasIngeridas() = comidasIngeridas
	
	method pedirElementoA(unComensal,unElemento){
		if(unComensal.noTieneElemento(unElemento))
			self.error("El comensal al que le pedimos " + unElemento + " NO lo tiene")
		else 
			unComensal.pasarElemento(self,unElemento)
	}

	method noTieneElemento(unElemento) = not(elementosCercanos.contains(unElemento))

	method pasarElemento(comensalReceptor,unElemento){
		self.criterioPasarElemento().aplicarCriterio(self,comensalReceptor,unElemento)
	}

	method soltarElemento(unElemento){
		elementosCercanos.remove(unElemento)
	}

	method recibirElemento(unElemento){
		elementosCercanos.add(unElemento)
	}

	method soltarPrimerElementoAMano(){
		self.soltarElemento(self.primerElementoAMano())
	}

	method primerElementoAMano() = elementosCercanos.first()

	method cambiarPosicion(nuevaPosicion) { posicion = nuevaPosicion }
	
	method decidirSiComer(unaComida){
		if(criterioComer.acepta(unaComida))
			self.comer(unaComida)
		else 
			self.error("La persona NO acepta esa comida")
	}
	
	method comer(unaComida){ comidasIngeridas.add(unaComida) }

	method estaPipon(){
		comidasIngeridas.any({comida => comida.esPesada()})
	}

	method laEstaPasandoBien() = self.comioAlgo() and self.objecion()
	
	method comioAlgo() = not(comidasIngeridas.isEmpty())
	
	method objecion()

}

object osky inherits Persona {
	override method objecion() = true
}

object moni inherits Persona {
	override method objecion() = self.posicion() == 1
}

object facu inherits Persona {
	override method objecion() = self.comioCarne()

	method comioCarne() = comidasIngeridas.any({comida => comida.esCarne()})
}

object vero inherits Persona {
	override method objecion() = self.noTieneMasDeTresElementosCerca()

	method noTieneMasDeTresElementosCerca() = elementosCercanos.size() <= 3
}