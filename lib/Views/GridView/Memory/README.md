# Memory.

Un juego de memoria.

## Game:

En esta clase se define las imagenes que se van a utilizar y se almacenan en una lista.



## info_card.

Esta clase solamente recoge el diseño que tienen las cartas.


## Memory.

Se inicia el juego con los valores a 0.

La zona de intentos y puntuación se define de la siguiente forma:
´´´
info_card("Intentos", "$tries"),
info_card("Puntuación", "$score"),
´´´

Para que la imagen cambie al hacer click :

´´´
_game.gameImg![index] = _game.cards_list[index];
_game.matchCheck
.add({index: _game.cards_list[index]});
´´´

Comprobar si ambas cartas son iguales:

´´´
if (_game.matchCheck.length == 2) {
if (_game.matchCheck[0].values.first ==
_game.matchCheck[1].values.first) {
´´´
