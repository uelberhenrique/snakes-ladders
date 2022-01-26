class Player {
/* Mostrar a silas */
  final int id;
  int _position = 0;
  Player({
    required this.id,
  });

  int get position {
    return _position;
  }

  set position(int value) {
    _position = value;
  }

  @override
  String toString() => 'Player(id: $id, _position: $_position)';
}
