import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/shared/styled_button.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';
import 'package:flutter_rpg_test/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameTextEditController = TextEditingController();
  final _sloganTextEditController = TextEditingController();

  void handleSubmit() {
    if (_nameTextEditController.text.trim().isEmpty) {
      print("name is empty");
    }
    if (_sloganTextEditController.text.trim().isEmpty) {
      print("slogan is empty");
    }
    print(_nameTextEditController.text);
    print(_sloganTextEditController.text);
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
        child: Column(
          children: [
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Center(child: TitleText('Welcome , New Player')),
            Center(
              child: StyledText('Create a name and slogan for your character.'),
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

            SizedBox(height: 50),

            StyledButton(
              onPressed: handleSubmit,
              child: const HeadlineText('Create Character'),

            ),
          ],
        ),
      ),
    );
  }
}
