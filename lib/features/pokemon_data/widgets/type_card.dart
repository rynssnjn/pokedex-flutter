import 'package:flutter/material.dart';
import 'package:pokedex_flutter/utilities/extensions.dart';
import 'package:rsj_f/rsj_f.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({
    this.name,
    Key? key,
  }) : super(key: key);

  final String? name;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 10,
      color: name?.colorValue ?? Colors.black,
      shadowColor: Colors.blueGrey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          name?.capitalize() ?? '',
          style: textTheme.bodyText1?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
