import 'domain/Snakesladders.dart';
import 'domain/dices.dart';
import 'domain/player.dart';

void main() {
  Player playerOne = Player(id: 1);
  Player playerTwo = Player(id: 2);

  Snakesladders snakesladders =
      Snakesladders(playerOne: playerOne, playerTwo: playerTwo);

  Dices dices = Dices();

  for (int i = 0; i < 50; i++) {
    print('$playerOne $playerTwo');
    snakesladders.play(dices);
  }

  print('$playerOne $playerTwo');
}
