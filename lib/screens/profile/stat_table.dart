import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatTable extends StatefulWidget {
  const StatTable(this.character, {super.key});
  final Character character;

  @override
  State<StatTable> createState() => _StatTableState();
}

class _StatTableState extends State<StatTable> {
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.secondaryColor,
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Row(
            children: [
              AnimatedRotation(
                turns: turns,
                duration: Duration(milliseconds: 200),
                child: Icon(
                  Icons.star,
                  color: widget.character.points > 0
                      ? AppColors.highlightColor
                      : AppColors.textColor,
                ),
              ),
              SizedBox(width: 10),

              StyledText('Stat points available'),
              Expanded(child: SizedBox(width: 10)),
              StyledText(widget.character.points.toString()),
            ],
          ),
        ),
        SizedBox(height: 5),

        Container(
          padding: const EdgeInsets.all(8.0),
          color: AppColors.secondaryColor,
          child: Table(
            children: widget.character.statAsList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(color: AppColors.secondaryColor),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledText(stat['title']!),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledText(stat['value']!),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_upward,
                          color: AppColors.textColor,
                        ),
                        onPressed: () {
                          setState(() {
                            if (widget.character.points > 0) {
                              turns += 0.25;
                              widget.character.incrementStat(stat['title']!);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_downward,
                          color: AppColors.textColor,
                        ),
                        onPressed: () {
                          setState(() {
                            if (widget.character.points >= 0) {
                              turns -= 0.25;
                              widget.character.decrementStat(stat['title']!);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
