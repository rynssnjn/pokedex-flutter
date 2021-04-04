import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({
    this.title,
    this.titleColor,
    this.children,
    Key key,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            title,
            style: textTheme.headline4.copyWith(color: titleColor),
          ),
        ),
        Expanded(child: ListView(children: children)),
      ],
    );
  }
}
