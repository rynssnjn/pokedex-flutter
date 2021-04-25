import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/data_container.dart';
import 'package:pokedex_flutter/features/pokemon_list/widgets/pokemon_list_item.dart';
import 'package:pokedex_flutter/utilities/string_constants.dart' as strings;
import 'package:rsj_f/rsj_f.dart';

class EvolutionContainer extends StatelessWidget {
  const EvolutionContainer({
    this.evolution,
    this.titleColor,
    Key? key,
  }) : super(key: key);

  final PokemonEvolution? evolution;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return DataContainer(
      title: strings.evolution.localized(context),
      titleColor: titleColor ?? Colors.black,
      children: [
        if (evolution?.base != null)
          PokemonListItem(
            onTap: () {},
            name: evolution?.base?.name?.capitalize() ?? '',
            imageUrl: evolution?.base?.url ?? '',
          ),
        if (evolution?.middle != null)
          PokemonListItem(
            onTap: () {},
            name: evolution?.middle?.name?.capitalize() ?? '',
            imageUrl: evolution?.middle?.url ?? '',
          ),
        if (evolution?.last?.isNotEmpty == true)
          ...evolution?.last
                  ?.map((pokemon) => PokemonListItem(
                        onTap: () {},
                        name: pokemon.name?.capitalize() ?? '',
                        imageUrl: pokemon.url ?? '',
                      ))
                  .toUnmodifiable() ??
              [],
      ],
    );
  }
}
