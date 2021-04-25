import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseStatBar extends StatelessWidget {
  BaseStatBar({
    this.rawScore,
    this.barWidth,
    this.valueColor,
  });

  final int? rawScore;
  final double? barWidth;
  final Color? valueColor;

  double _scoreWidth(int score) {
    return (score * (barWidth ?? 0)) / 200;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: 5,
          width: barWidth,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        Container(
          height: 5,
          width: _scoreWidth(rawScore ?? 0),
          decoration: BoxDecoration(
            color: valueColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ],
    );
  }
}
