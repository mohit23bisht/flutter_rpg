// Character Model (class)
//     -> id (int/string?)
//     -> name (string)
//     -> slogan (string)
//     -> isFav (boolean)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

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
  void toggleSkill(Skill skill) {

  if (skills.contains(skill)) {

    skills.remove(skill);

  } else {

    skills.add(skill);

  }

}

  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

  // character to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statAsMap,
      'points': points,
    };
  }

 // character from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    Character character = Character(
      name: data['name'],
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
      ),
      slogan: data['slogan'],
      id: snapshot.id,
    );

    // update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }

    // set isFav
    if (data['isFav'] == true) {
      character.toggleIsFav();
    }
    // update stats & points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}



// dummy character data
// List<Character> characters = [
//   Character(
//     id: '1',
//     name: 'Klara',
//     vocation: Vocation.wizard,
//     slogan: 'Kapumf!',
//   ),
//   Character(
//     id: '2',
//     name: 'Jonny',
//     vocation: Vocation.junkie,
//     slogan: 'Light me up...',
//   ),
//   Character(
//     id: '3',
//     name: 'Crimson',
//     vocation: Vocation.raider,
//     slogan: 'Fire in the hole!',
//   ),
//   Character(
//     id: '4',
//     name: 'Shaun',
//     vocation: Vocation.ninja,
//     slogan: 'Alright then gang.',
//   ),
// ];

