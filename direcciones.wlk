object arriba {
    method siguientePosicion(posicion) = posicion.up(1)

    method haySiguientePosicion(posicion) = self.siguientePosicion(posicion).y() < game.height() 
}

object abajo {
    method siguientePosicion(posicion) = posicion.down(1)

    method haySiguientePosicion(posicion) = self.siguientePosicion(posicion).y() >= 0
}

object izquierda {
    method siguientePosicion(posicion) = posicion.left(1)

    method haySiguientePosicion(posicion) = self.siguientePosicion(posicion).x() >= 0
}

object derecha {
    method siguientePosicion(posicion) = posicion.right(1)

    method haySiguientePosicion(posicion) = self.siguientePosicion(posicion).x() < game.width() 
}