import elementos.*
import criteriosPasarElementos.*

class Persona {
	
	var posicion
	var elementosCercanos = []
	var criterioPasarElemento
	
	method posicion() = posicion
	method elementosCercanos() = elementosCercanos
	method criterioPasarElemento() = criterioPasarElemento

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

	method soltarPrimerElementoAMano(unElemento){
		self.soltarElemento(self.primerElementoAMano())
	}

	method primerElementoAMano() = elementosCercanos.first()

	method cambiarPosicion(nuevaPosicion) { posicion = nuevaPosicion }

}