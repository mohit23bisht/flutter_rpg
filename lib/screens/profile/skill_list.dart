import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills
        .where((skill) => skill.vocation == widget.character.vocation)
        .toList();
    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills.first;

      widget.character.toggleSkill(selectedSkill);
    } else {
      selectedSkill = widget.character.skills.first;
    }
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
              return GestureDetector(
                onTap: () {
                  setState(() {
                    //selectedSkill = skill;
                    widget.character.toggleSkill(skill);
                  });
                },
                child: Image.asset(
                  'assets/img/skills/${skill.image}',
                  width: 70,
                  colorBlendMode: BlendMode.color,
                  color: !(widget.character.skills.contains(skill) )
                      ? Colors.black.withValues(alpha: 0.8)
                      : Colors.transparent,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 5),

          StyledText(selectedSkill.name),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
