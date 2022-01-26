import 'dices.dart';
import 'player.dart';

class Snakesladders {
  //Aqui poderia ser um map ?
  List<int> _headSnake = [
    16,
    49,
    62,
    46,
    74,
    64,
    89,
    95,
    99,
    92
  ]; //Começo da cobrar
  List<int> _footSnake = [
    6,
    11,
    19,
    25,
    53,
    60,
    68,
    75,
    80,
    88,
  ]; // fim da cobra

  List<int> _footLadder = [
    2,
    7,
    8,
    15,
    21,
    28,
    36,
    51,
    71,
    78,
    87
  ]; //Começo da escada
  List<int> _headLadder = [
    38,
    14,
    31,
    26,
    42,
    84,
    44,
    67,
    91,
    98,
    94
  ]; //Fim da escada

  final Player playerOne;
  final Player playerTwo;

  Player? currentPlayer;

  Snakesladders({
    required this.playerOne,
    required this.playerTwo,
  });

  /* Evento*/
  void play(Dices dices) {
    if (playerOne.position == 100 || playerTwo.position == 100) {
      print('O jogo acabou!');
      return;
    }

    final diceOne = dices.diceOne;
    final diceTwo = dices.diceTwo;
    currentPlayer ??= playerOne;

    final nextPosition = diceOne + diceTwo;
    var playerPosion = currentPlayer!.position + nextPosition;

    if (playerPosion == 100) {
      currentPlayer!.position = playerPosion;
      print('O jogador ${currentPlayer!.id} Venceu!');
      return;
    }

    //Checando se a jogada do player é maior que 100 e diminuindo as casas.
    if ((playerPosion > 100)) {
      int sobra = playerPosion - 100;
      playerPosion = 100 - sobra;
      //retorna String "Jogador X está na casa Y"
    }

    //Verificando se caiu na boca da cobra ou no inicio da escada.

    final indexSnake = _headSnake.indexOf(playerPosion);
    if (indexSnake > -1) {
      print('Cobra $playerPosion ${currentPlayer!.id}');
      playerPosion = _footSnake[indexSnake];
    }

    final indexLadder = _footLadder.indexOf(playerPosion);
    if (indexLadder > -1) {
      print('Escada $playerPosion ${currentPlayer!.id}');
      playerPosion = _headLadder[indexLadder];
    }

    currentPlayer!.position = playerPosion;
    //Está vendo qual é o jogador atual | SILAS
    if (diceOne != diceTwo) {
      currentPlayer = playerOne.id == currentPlayer!.id ? playerTwo : playerOne;
    }
  }
}
