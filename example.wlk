class Coliseo{}
class Armas {
  method poderDeAtaque() 
}

class DeFilo inherits Armas{
  const filoDeArma // 0 o 1
  const longitud  // en cm
  override method poderDeAtaque() = filoDeArma * longitud
  
}

class Contundentes inherits Armas {
  const peso
  override method poderDeAtaque() = peso 
}
class Proteccion {
  method Armadura(gladiador)
}
class Casco inherits Proteccion{
  override method Armadura(gladiador) = 10
}
class Escudos inherits Proteccion{
  override method Armadura(gladiador) = 5 + (gladiador.destreza() * 0.1)
}
class Gladiadores {
  var vida = 100
  method atacar(unGladiador)= unGladiador.recibirDanio(self)
  method fuerza()
  method poderDeDefensa()
  method poderDeAtaque()
  method recibirDanio(unGladiador) {vida = vida - unGladiador.poderDeAtaque() - self.poderDeDefensa()}
  method pelea(unGladiador) {self.atacar(unGladiador)  unGladiador.atacar(self)}
}
class Mirmillones inherits Gladiadores {
  const armaEnMano // espada o gladius
  var proteccion // escudo o casco
  var fuerza
  method destreza() = 15
  method cambiarProteccion(nuevaProteccion){proteccion = nuevaProteccion}
  override method poderDeDefensa(){}
  override method poderDeAtaque() = armaEnMano.poderDeAtaque() + fuerza
  method cambiarFuerza(nuevaFuerza) { fuerza = nuevaFuerza }
  override method atacar(unGladiador) {unGladiador.recibirDanio(self) self.cambiarDestreza()}
}
class Dimachaerus inherits Gladiadores {
  var destreza 
  const armas = []
  
  override method fuerza() = 10
  override method poderDeDefensa() = destreza/2
  override method poderDeAtaque(){}
  method cambiarDestreza(nuevaDestreza){destreza = nuevaDestreza}
  method agregarArma(unArma) {armas.add(unArma)}
  method poderListaArmas()= armas.sum({a => a.valorDeAtaque()})
  
}
class grupo {
  const nombre
  var cantidadpeleas
  const miembros = []
  method pelea(otroGrupo){
    self.elMasFuerte().atacar(otroGrupo.elMasFuerte())
  }
  method elMasFuerte() = miembros.filter({m => m.vida()>0}).max({m => m.fuerza()})
}


