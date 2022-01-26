import 'dart:math';

class Dices {
  Random random = Random();

  static const maxCount = 6;

  int get diceOne {
    return random.nextInt(maxCount) + 1;
  }

  int get diceTwo {
    return random.nextInt(maxCount) + 1;
  }
}
