import direcciones.*
import silvestre.*

object pepita {
	var energia = 10000
	var property position = game.origin()
	const predador = silvestre
	const joulesPorKM = 9

	method image() {
		return self.estado()
	}

	method text() = "" + self.energia()

	method textColor() = "FFFFFF"

	method estado() {
		return  if (self.esAtrapada() || not self.puedeVolar()) 
					{"pepita-gris.png"}
				else 
					{"pepita.png"}
	}

	method esAtrapada() = self.estaSobre(predador)

	method estaSobre(algo) = position == algo.position()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerAca() {
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.desaparecer()
	}

	method loQueHayAca() = game.uniqueCollider(self)

	method volar(kms) {
		energia -= self.energiaNecesaria(1)
	}

	method energiaNecesaria(kms) = joulesPorKM * kms
	
	method puedeVolar() = energia >= self.energiaNecesaria(1) && not self.esAtrapada() 

	method energia() = energia

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

	method puedeMover(direccion) = direccion.haySiguientePosicion(position)

	method perder() = game.say(self, "XD")
}



