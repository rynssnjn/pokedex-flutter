import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_statistics.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/data_container.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/stats/stats_card_tile.dart';
import 'package:pokedex_flutter/utilities/string_constants.dart' as strings;
import 'package:rsj_f/rsj_f.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    this.stats,
    this.decorationColor,
    Key? key,
  }) : super(key: key);

  final List<PokemonStatistics>? stats;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return DataContainer(
      title: strings.stats.localized(context),
      titleColor: decorationColor ?? Colors.black,
      children: stats
              ?.map((stat) => StatsCardTile(
                    category: stat.stats?.name,
                    value: stat.baseState,
                    barColor: decorationColor,
                  ))
              .toUnmodifiable() ??
          [],
    );
  }
}
