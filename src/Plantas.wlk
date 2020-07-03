import Parcela.*
class Planta {
	var property altura 
	var property anioDeObtencion
	var property espacioQueOcupa
	method toleranciaPorDia() = 7 
	
	method esFuerte() = self.toleranciaPorDia() > 9
	method daNuevasSemillas() = self.esFuerte()
	
	method esJoven() = self.anioDeObtencion() > 2012
}




class Menta inherits Planta {
	override method daNuevasSemillas() = super() and altura > 0.4
	override method espacioQueOcupa() = altura * 3 
	 method esIdealLa(parcela)= parcela.superficie() > 6
}




class Soja inherits Planta {
	override method toleranciaPorDia(){
		if(self.altura() < 0.5){
			return  6
		}
		else if(self.altura().between(0.5,1)){
			return  8
		}
		else {return 12}
	}
	override method daNuevasSemillas() = super() and self.cumpleConLaCondicion()
	method cumpleConLaCondicion() = self.anioDeObtencion() > 2007 and altura.between(0.75,0.9) 
	override method espacioQueOcupa() = altura / 2 
	 method esIdealLa(parcela) = parcela.horasDeSolQueRecibePorDia() == self.toleranciaPorDia()
}




class Quinoa inherits Planta {
	override method toleranciaPorDia() {
	if(self.espacioQueOcupa() < 0.3){
		return 10
	}
	else{return self.toleranciaPorDia()}
	}
	override method daNuevasSemillas() = super() or anioDeObtencion.between(2001,2008)
	 method esIdealLa(parcela) =  not parcela.tienePlantasDeMetroYMedioOMas()
}


class SojaTrangenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esIdealLa(parcela) = parcela.cantMaximaDePlantas() == 1
	
}


class HiherbaBuena inherits Menta {
	override method espacioQueOcupa() = super() * 2
	
}


 
 
 
 
 
 
 
 
 
 
 
 
 
