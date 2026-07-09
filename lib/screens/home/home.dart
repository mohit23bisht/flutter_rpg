import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart' hide Create;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();
    // TODO: implement initState
    super.initState();
  }

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
                      return Slidable(
                        key: Key(value.characters[index].id),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),

                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                Provider.of<CharacterStore>(context, listen: false)
                                    .removeCharacter(value.characters[index]);
                              },

                              backgroundColor: Colors.red,

                              foregroundColor: Colors.white,

                              icon: Icons.delete,

                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: CharacterCard(value.characters[index]),
                      );
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
