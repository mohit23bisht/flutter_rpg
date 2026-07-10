import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameTextEditController = TextEditingController();
  final _sloganTextEditController = TextEditingController();
  Vocation _selectedVocation = Vocation.junkie;

  void _updateVocation(Vocation vocation) {
    print("Tapped: ${vocation.name}");
    setState(() {
      _selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameTextEditController.text.trim().isEmpty) {
      print("name is empty");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const TitleText('Invalid Input'),
            content: const StyledText(
              'Please enter a name for your character.',
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const HeadlineText('OK'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_sloganTextEditController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const TitleText('Invalid Input'),
            content: const StyledText(
              'Please enter a slogan for your character.',
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const HeadlineText('OK'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }

    final characterStore = Provider.of<CharacterStore>(context, listen: false);

    if (characterStore.characterExists(_nameTextEditController.text)) {
      showDialog(
        context: context,

        builder: (_) => AlertDialog(
          title: const TitleText('Duplicate Name'),

          content: const StyledText(
            'A character with this name already exists. Please choose another name.',
          ),

          actions: [
            StyledButton(
              onPressed: () => Navigator.pop(context),

              child: const HeadlineText('OK'),
            ),
          ],

          actionsAlignment: MainAxisAlignment.center,
        ),
      );

      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        id: uuid.v4(),

        name: _nameTextEditController.text.trim(),

        slogan: _sloganTextEditController.text.trim(),

        vocation: _selectedVocation,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameTextEditController.dispose();
    _sloganTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const HeadlineText('Character creation')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: TitleText('Welcome , New Player')),
              Center(
                child: StyledText(
                  'Create a name and slogan for your character.',
                ),
              ),
              SizedBox(height: 30),

              TextField(
                controller: _nameTextEditController,
                cursorColor: AppColors.textColor,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  label: StyledText('Character name'),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _sloganTextEditController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
              ),
              SizedBox(height: 20),

              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              Center(child: TitleText('Choose a vocation')),
              Center(
                child: StyledText('This determines your available skills.'),
              ),

              SizedBox(height: 30),

              VocationCard(
                vocation: Vocation.junkie,
                onTap: _updateVocation,
                isSelected: _selectedVocation == Vocation.junkie,
              ),
              VocationCard(
                vocation: Vocation.ninja,
                onTap: _updateVocation,
                isSelected: _selectedVocation == Vocation.ninja,
              ),
              VocationCard(
                vocation: Vocation.raider,
                onTap: _updateVocation,
                isSelected: _selectedVocation == Vocation.raider,
              ),
              VocationCard(
                vocation: Vocation.wizard,
                onTap: _updateVocation,
                isSelected: _selectedVocation == Vocation.wizard,
              ),

              StyledButton(
                onPressed: handleSubmit,
                child: const HeadlineText('Create Character'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
