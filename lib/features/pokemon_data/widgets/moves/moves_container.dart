import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/data_container.dart';
import 'package:pokedex_flutter/utilities/string_constants.dart' as string;
import 'package:rsj_f/rsj_f.dart';

class MovesContainer extends StatelessWidget {
  const MovesContainer({
    this.moves,
    this.titleColor,
    Key? key,
  }) : super(key: key);

  final List<String>? moves;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DataContainer(
      title: string.moves.localized(context),
      titleColor: titleColor ?? Colors.black,
      children: [
        GridView.count(
          childAspectRatio: 2,
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: moves
                  ?.map((move) => Card(
                        elevation: 10,
                        child: Center(
                          child: Text(
                            move.capitalize(),
                            style: textTheme.subtitle2,
                          ),
                        ),
                      ))
                  .toUnmodifiable() ??
              [],
        ),
      ],
    );
  }
}
