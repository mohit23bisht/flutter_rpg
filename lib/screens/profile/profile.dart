import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stat_table.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HeadlineText(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.secondaryColor,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/img/vocations/${character.vocation.image}',
                      width: 80,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(character.vocation.title),
                          StyledText(character.vocation.description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
          
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              SizedBox(height: 20),
          
              Container(
                color: AppColors.secondaryColor,
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText('Slogan'),
                    StyledText(character.slogan),
                    SizedBox(height: 10),
          
                    TitleText('Weapon of choice'),
                    StyledText(character.vocation.weapon),
                    SizedBox(height: 10),
          
                    TitleText('Unique Ability'),
                    StyledText(character.vocation.ability),
                  ],
                ),
              ),
              SizedBox(height: 20),
              StatTable(character),
          
              SkillList(character),
              
            ],
          ),
        ),
      ),
    );
  }
}
