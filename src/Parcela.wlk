import Plantas.*
class Parcelas {
	var property ancho
	var property largo
	var property horasDeSolQueRecibePorDia
	var property plantas = #{}
	method superficie() = ancho * largo 
	method cantMaximaDePlantas(){
		if(self.ancho() >self.largo()){
			return self.superficie() /5
		}
		else {return (self.superficie() /3) + largo}
	}
	method tieneSangreJoven()= plantas.any{planta=>planta.esJoven()}
	method plantarUnaPlnata(planta){
		if(self.hayLugarEnLaParcela() and  horasDeSolQueRecibePorDia >= planta.toleranciaPorDia() +2){
			plantas.add(planta)
	}
	else { throw new Exception(message = "la parcela estaa llena") }
	
	}
	method cantidadDePlantas()= plantas.size()
	method hayLugarEnLaParcela() =  self.cantidadDePlantas() +1 <= self.cantMaximaDePlantas()
	method tienePlantasDeMetroYMedioOMas(){
		return plantas.any{planta=>planta.altura() > 1.5}
	}
	
	
}
class ParcelasEcologicas inherits Parcelas{
	   method estaBienAsociadaLa(planta){
		return planta.esJoven() and planta.esIdealLa(self)
	}
	method cantidadDePlantasBienAsociadas(){
		return plantas.filter{vida=> self.estaBienAsociadaLa(vida)}.size()
	}
}
class ParcelasIndustriales inherits Parcelas{
	  method estaBienAsociadaLa(planta){
		return plantas.size() + 1 <= 2 and  planta.esFuerte()
	}
	
}

object inta {
	const property coleccion = #{}
	method cantidadDePlantas() = coleccion.sum{cole=>cole.cantidadDePlantas()} 
	method parcelasConMasDeCuatroPlantas() = coleccion.filter{parcela=>parcela.cantDePlantas() > 4}
	method parcelaMasAutosustentable() = self.parcelasConMasDeCuatroPlantas().max{parcela=>parcela.cantidadDePlantasBienAsociadas()}
	
}



