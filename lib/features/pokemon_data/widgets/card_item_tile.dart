import 'package:flutter/material.dart';

class CardItemTile extends StatelessWidget {
  const CardItemTile({
    this.category,
    this.value,
    this.icon,
    this.leadingColor,
    Key? key,
  }) : super(key: key);

  final String? category;
  final String? value;
  final Color? leadingColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 10,
      child: ListTile(
        leading: Icon(
          icon,
          size: 50,
          color: leadingColor,
        ),
        title: Text(value ?? '', style: textTheme.bodyText1),
        subtitle: Text(category ?? '', style: textTheme.caption),
      ),
    );
  }
}
