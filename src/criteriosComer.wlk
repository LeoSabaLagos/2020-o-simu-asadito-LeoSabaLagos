
object vegetariano {
		
	method acepta(unaComida) = not(unaComida.esCarne())
	
}

object dietetico {
		
	method acepta(unaComida) = unaComida.calorias() < 500
	
}

object alternado {
	
	var flagAlternador = false
	
	method acepta(unaComida){ 
		if(flagAlternador){
			flagAlternador = false
			return true
		}
		else{
			flagAlternador = true
			return false
		}
	}
	
}

object combinacionCondiciones {
	
	method acepta(unaComida) = unaComida.calorias() >= 500 and unaComida.esCarne()
	
}
