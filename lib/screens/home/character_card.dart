import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';
import 'package:flutter_rpg_test/theme.dart';
class CharacterCard extends StatelessWidget {
  const CharacterCard(this.characterName,{super.key});

  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            TitleText(characterName),
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