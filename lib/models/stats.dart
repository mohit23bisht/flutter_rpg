// stats (mixin)
//         -> health (int)
//         -> attack (int)
//         -> defense (int)
//         -> skill (int)
//         -> points (int)

mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  // Getters
  int get points => _points;

  Map<String, int> get statAsMap => {
    "health": _health,
    "attack": _attack,
    "_defense": _defense,
    "_skill": _skill,
  };

  List<Map<String, String>> get statAsList => [
    {"title": "health", "value": _health.toString()},
    {"title": "attack", "value": _attack.toString()},
    {"title": "defense", "value": _defense.toString()},
    {"title": "skill", "value": _skill.toString()},
  ];

  /// Increment the named stat by 1 if there are available points.
  /// Returns true if the increment succeeded, false otherwise.
  void incrementStat(String stat) {
    if (_points > 0) {
      switch (stat.toLowerCase()) {
        case 'health':
          _health++;
          break;
        case 'attack':
          _attack++;
          break;
        case 'defense':
          _defense++;
          break;
        case 'skill':
          _skill++;
          break;
      }
      _points--;
    }
  }

  /// Decrement the named stat by 1 and refund a point.
  /// Returns true if the decrement succeeded, false otherwise.
  void decrementStat(String stat) {
    if (_points > 0) {
      switch (stat.toLowerCase()) {
        case 'health':
          if (_health <= 5) {
            _health--;
          }
          break;
        case 'attack':
          if (_attack <= 5) {
            _attack--;
          }
          break;
        case 'defense':
          if (_defense <= 5) {
            _defense--;
          }
          break;
        case 'skill':
          if (_skill <= 5) {
            _skill--;
          }
          break;
      }
      _points++;
    }
  }
}
