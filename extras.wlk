import pepita.*
import wollok.game.*

object silvestre {
	method position() = game.at(self.x(), 0)

	method image() = "silvestre.png"

    method x() = pepita.position().x().max(3)

    method colisionar(algo) {
        algo.perder()
    }
}

object nido {
    var property position = game.at(8,8)

    method image() = "nido.png"

    method colisionar(algo) {
        algo.ganar()
    }
}

