import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/screens/home/home.dart';
import 'package:flutter_rpg_test/services/character_store.dart';
import 'package:flutter_rpg_test/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    
      create: (_) => CharacterStore(),

      child: MaterialApp(theme: appTheme, home: const Home()),
    ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(children: [Text('data')]),
    );
  }
}
