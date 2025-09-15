import wollok.game.*

object manzana {
	const base= 5
	var madurez = 1

	method image() = "manzana.png"

	method position() = game.center()

	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

	method desaparecer() {
		game.removeVisual(self)
	}

}

object alpiste {

	method position() = game.at(2, 7)

	method image() = "alpiste.png"

	method energiaQueOtorga() {
		return 20
	} 

	method desaparecer() {
		game.removeVisual(self)
	}
}

