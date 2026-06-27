import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/models/character.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';
import 'package:flutter_rpg_test/theme.dart';
class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character,{super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset('assets/img/vocations/${character.vocation.image}',width: 80,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineText(character.name),
                 TitleText(character.vocation.title)

              ],
            ),
            Expanded(child: SizedBox()), // Spacer to push the button to the right
            IconButton(
              onPressed: () {
                // Handle edit action
              },
              icon:  Icon(Icons.arrow_forward, color: AppColors.textColor),
            ),
          ],
        ),
      ),
       
     
    );
  }
}