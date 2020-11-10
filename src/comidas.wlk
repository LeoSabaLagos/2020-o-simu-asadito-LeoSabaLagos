
class Comida {
	var calorias
	
	method calorias() = calorias
}


class PechitoCerdo inherits Comida {
	
	method esCarne() = true
	
}

class Ensalada inherits Comida {
	
	method esCarne() = false
	
}

class Molleja inherits Comida {
	
	method esCarne() = true
	
}