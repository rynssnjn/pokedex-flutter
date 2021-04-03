import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_pokemon.dart';

part 'pagination_pokemon.freezed.dart';
part 'pagination_pokemon.g.dart';

@freezed
abstract class PaginationPokemon with _$PaginationPokemon {
  factory PaginationPokemon({
    @JsonKey(nullable: true, name: 'count') int count,
    @JsonKey(nullable: true, name: 'next') String next,
    @JsonKey(nullable: true, name: 'previous') String previous,
    @JsonKey(nullable: true, name: 'results') List<PokemonPokemon> results,
  }) = _PaginationPokemon;

  factory PaginationPokemon.fromJson(Map<String, dynamic> json) => _$PaginationPokemonFromJson(json);
}
