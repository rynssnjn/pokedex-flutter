import 'package:flutter/material.dart';
import 'package:pokedex_flutter/utilities/colors.dart';

class PokedexCircularIndicator extends StatelessWidget {
  const PokedexCircularIndicator({
    this.size = 50.0,
    this.valueColor = lightOrange,
    this.backgroundColor = Colors.transparent,
    Key key,
  }) : super(key: key);

  final double size;
  final Color valueColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
