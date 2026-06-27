// Character Model (class)
//     -> id (int/string?)
//     -> name (string)
//     -> slogan (string)
//     -> isFav (boolean)

import 'package:flutter_rpg_test/models/skill.dart';
import 'package:flutter_rpg_test/models/stats.dart';
import 'package:flutter_rpg_test/models/vocation.dart';

class Character with Stats {
  final Set<Skill> skills = {};
  Vocation vocation;
  String id;
  String name;
  String slogan;
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });
}
// dummy character data
List<Character> characters = [
  Character(
    id: '1',
    name: 'Klara',
    vocation: Vocation.wizard,
    slogan: 'Kapumf!',
  ),
  Character(
    id: '2',
    name: 'Jonny',
    vocation: Vocation.junkie,
    slogan: 'Light me up...',
  ),
  Character(
    id: '3',
    name: 'Crimson',
    vocation: Vocation.raider,
    slogan: 'Fire in the hole!',
  ),
  Character(
    id: '4',
    name: 'Shaun',
    vocation: Vocation.ninja,
    slogan: 'Alright then gang.',
  ),
];

