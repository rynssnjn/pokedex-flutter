import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_evolution_chain.dart';

part 'pokemon_species.freezed.dart';
part 'pokemon_species.g.dart';

@freezed
abstract class PokemonSpecies with _$PokemonSpecies {
  factory PokemonSpecies({
    @JsonKey(nullable: true, name: 'evolution_chain') PokemonEvolutionChain evolutionChain,
  }) = _PokemonSpecies;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => _$PokemonSpeciesFromJson(json);
}
