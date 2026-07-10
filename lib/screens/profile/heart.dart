import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';

class Heart extends StatefulWidget {
  const Heart(this.character,{super.key});
  final Character character;
  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,

      duration: const Duration(milliseconds: 350),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 50),

      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        onPressed: () {
          _controller.forward(from: 0);

          setState(() {
            widget.character.toggleIsFav();
          });

        },
        icon: ScaleTransition(
          scale: _scaleAnimation,

          child: Icon(Icons.favorite, color: widget.character.isFav ? Colors.red :  Colors.grey[800]),
        ),
      ),
    );
  }
}
