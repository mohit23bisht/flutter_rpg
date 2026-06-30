import 'package:flutter/material.dart';
import 'package:flutter_rpg_test/models/vocation.dart';
import 'package:flutter_rpg_test/shared/styled_text.dart';
import 'package:flutter_rpg_test/theme.dart';

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
                color: !isSelected ? AppColors.secondaryColor : Colors.transparent,
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
