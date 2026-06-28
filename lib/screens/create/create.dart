import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';
import 'package:flutter_rpg_test/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              cursorColor: AppColors.textColor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.chat),
                label: StyledText('Character slogan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
