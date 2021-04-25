import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_ability.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/about/about_container.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/evolution/evolution_container.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/moves/moves_container.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/stats/stats_container.dart';
import 'package:pokedex_flutter/models/async.dart';
import 'package:rsj_f/rsj_f.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    this.pokemon,
    this.typeColor,
    this.evolutionState,
    Key? key,
  }) : super(key: key);

  final PokemonData? pokemon;
  final Color? typeColor;
  final Async<PokemonEvolution>? evolutionState;

  String? _getFormattedAbilities(List<PokemonAbility?>? abilities) {
    final s = abilities?.map((e) => e?.name?.capitalize() ?? '').toUnmodifiable();
    return s!.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        AboutContainer(
          height: pokemon?.height,
          weight: pokemon?.weight,
          baseExperience: pokemon?.baseExperience,
          abilities: _getFormattedAbilities(pokemon?.abilities?.map((e) => e.ability).toUnmodifiable()),
          decorationColor: typeColor,
        ),
        StatsContainer(
          stats: pokemon?.stats,
          decorationColor: typeColor,
        ),
        evolutionState?.when(
              (evolution) => EvolutionContainer(
                evolution: evolution,
                titleColor: typeColor,
              ),
              loading: () => Center(child: RSJCircularIndicator(size: 30)),
              error: (key) => Text(key?.localized(context) ?? ''),
            ) ??
            Container(),
        MovesContainer(
          moves: pokemon?.moves?.map((e) => e.move?.name ?? '').toUnmodifiable(),
          titleColor: typeColor,
        ),
      ],
      options: CarouselOptions(
        height: double.infinity,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
