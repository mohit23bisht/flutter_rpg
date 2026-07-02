import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.visible,
      style: GoogleFonts.kanit(
        textStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class HeadlineText extends StatelessWidget {
  const HeadlineText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.kanit(
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.kanit(
        textStyle: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
