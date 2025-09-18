import direcciones.*
import extras.*

object pepita {
	var energia = 100
	var property position = game.origin()
	const predador = silvestre
	const joulesPorKM = 3

	method energia() = energia

	method image() = self.estado()

	method text() = "" + self.energia()

	method textColor() = "FFFFFF"

	method estado() {
		return  if (not self.puedeVolar()) 
					{"pepita-gris.png"}
				else 
					{"pepita.png"}
	}

	method esAtrapada() = self.estaSobre(predador)

	method estaSobre(algo) = position == algo.position()

	method energiaNecesaria(kms) = joulesPorKM * kms

	method puedeVolar() = energia >= self.energiaNecesaria(1) && not self.esAtrapada() 

	method loQueHayAca() = game.uniqueCollider(self)

	method puedeMover(direccion) = direccion.haySiguientePosicion(position)

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerAca() {
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.desaparecer()
	}

	method volar(kms) {
		energia -= self.energiaNecesaria(1)
	}
	
	method mover(direccion) {
		if (not self.puedeVolar()) {
			self.perder()
		} else if (self.puedeMover(direccion)) {
			position = direccion.siguientePosicion(position)
			self.volar(1)
		}
	}

	method perderAltura() {
		if (self.puedeMover(abajo)) {
			position = game.at(self.position().x(), self.position().y() - 1)
		}
	}

	method perder() = game.say(self, "XD")
}



