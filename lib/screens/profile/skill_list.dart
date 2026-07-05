import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/models/character.dart';
import 'package:flutter_rpg_test/models/skill.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;

  @override
  void initState() {
    availableSkills = allSkills
      .where((skill) => skill.vocation == widget.character.vocation)
      .toList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: TitleText('Choose An Active Skill')),
          Center(child: StyledText("Skill are unique to your vocation.")),
          // Add your skill list UI here

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: availableSkills.map((skill) {
              return Image.asset(
                'assets/img/skills/${skill.image}',
                width: 70,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
