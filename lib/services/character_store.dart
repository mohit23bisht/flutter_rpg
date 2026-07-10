import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  List<Character> get characters => _characters;

  // add a new character
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // remove a character
  void removeCharacter(Character character) {
    FirestoreService.deleteCharacter(character);
    _characters.remove(character);
    notifyListeners();
  }

  // initially fetch characters

  void fetchCharactersOnce() async {
    if (_characters.isEmpty) {
      final snapshot = await FirestoreService.getCharactersOnce();
      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
        notifyListeners();
      }
    }
  }

  //save(update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    // final index = _characters.indexWhere((c) => c.id == character.id);
    return;
  }

  bool characterExists(String name) {
    return characters.any(
      (character) =>
          character.name.trim().toLowerCase() == name.trim().toLowerCase(),
    );
  }
}
