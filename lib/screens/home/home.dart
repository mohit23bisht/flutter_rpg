import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/models/character.dart';
import 'package:flutter_rpg_test/screens/home/character_card.dart';
import 'package:flutter_rpg_test/shared/styled_button.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadlineText('Home')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return CharacterCard(characters[index]);
                },
              ),
            ),
        
           
        
            StyledButton(child: const HeadlineText('Create New '), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
