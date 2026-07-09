import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:uuid/uuid.dart';


var uuid = const Uuid();
class VocationCard extends StatelessWidget {
  const VocationCard({
    required this.isSelected,
    required this.onTap,
    required this.vocation,
    super.key,
  });

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(vocation),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80,
                colorBlendMode: BlendMode.color,
                color: !isSelected ? Colors.black.withValues(alpha: 0.8) : Colors.transparent,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineText(vocation.name),
                    StyledText(
                     
                      vocation.description,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
