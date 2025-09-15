import pepita.*
import wollok.game.*

object silvestre {
	method position() = game.at(self.x(), 0)

	method image() = "silvestre.png"

    method x() = pepita.position().x().max(3)
}