import direcciones.*
import extras.*

object pepita {
	var energia = 100
	var property position = game.origin()
	const joulesPorKM = 3
	
	var property estado = normal
	const normal = "pepita.png"
	const inmovilizada = "pepita-gris.png"
	const victoriosa = "pepita-grande.png"

	method energia() = energia

	method image() = self.estado()

	method text() = "" + self.energia()

	method textColor() = "FFFFFF"

	method energiaNecesaria(kms) = joulesPorKM * kms

	method puedeVolar() = energia >= self.energiaNecesaria(1) && estado != inmovilizada

	method puedeMover(direccion) = direccion.haySiguientePosicion(position)

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
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

	method ganar() {
		estado = victoriosa
		game.say(self, "GANASTE")
		game.removeTickEvent("Gravedad")
	}

	method perder() {
		estado = inmovilizada
		game.say(self, "PERDISTE")
		game.removeTickEvent("Gravedad")
	} 
}



