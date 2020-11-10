import persona.*

class CriterioPasarElementos {
	
    method aplicarCriterio(comensalEmisor,comensalReceptor,unElemento){
        self.hacerIntercambio(comensalEmisor,comensalReceptor,unElemento)
    }

    method hacerIntercambio(comensalEmisor,comensalReceptor,unElemento){
        comensalEmisor.soltarElemento(unElemento)
        comensalReceptor.recibirElemento(unElemento)
    }
	
}

class Normal inherits CriterioPasarElementos{

}

class Sordo inherits CriterioPasarElementos{

    override method aplicarCriterio(comensalEmisor,comensalReceptor,unElemento){
        comensalEmisor.soltarPrimerElementoAMano(unElemento)
        comensalReceptor.recibirElemento(unElemento)
    }

}

class ComerTranquilo inherits CriterioPasarElementos{

    override method aplicarCriterio(comensalEmisor,comensalReceptor,unElemento){
        comensalEmisor.elementosCercanos().forEach({elemento => self.hacerIntercambio(comensalEmisor,comensalReceptor,elemento)})
    }

}

class CambiarPosiciones inherits CriterioPasarElementos{
    override method aplicarCriterio(comensalEmisor,comensalReceptor,unElemento){
        super(comensalEmisor,comensalReceptor,unElemento)
        self.intercambiarPosiciones(comensalEmisor,comensalReceptor)
    }

    method intercambiarPosiciones(comensalEmisor,comensalReceptor){
        var posAnteriorEmisor = comensalEmisor.posicion()

        comensalEmisor.cambiarPosicion(comensalReceptor.posicion())
        comensalReceptor.cambiarPosicion(posAnteriorEmisor) 
    }
}
