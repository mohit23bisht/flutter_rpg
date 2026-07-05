import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/models/character.dart';
import 'package:flutter_rpg_test/screens/create/create.dart';
import 'package:flutter_rpg_test/screens/home/character_card.dart';
import 'package:flutter_rpg_test/services/character_store.dart';
import 'package:flutter_rpg_test/shared/styled_button.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';
import 'package:provider/provider.dart' hide Create;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadlineText('Characters')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,

                    itemBuilder: (context, index) {
                      return CharacterCard(value.characters[index]);
                    },
                  );
                },
              ),
            ),

            StyledButton(
              child: const HeadlineText('Create New '),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const Create()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
