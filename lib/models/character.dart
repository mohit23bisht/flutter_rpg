// Character Model (class)
//     -> id (int/string?)
//     -> name (string)
//     -> slogan (string)
//     -> isFav (boolean)

class Character {
  int id;
  String name;
  String slogan;
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  Character({required this.id, required this.name, required this.slogan});
}
