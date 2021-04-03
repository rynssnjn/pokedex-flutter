import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_pokemon.freezed.dart';
part 'pokemon_pokemon.g.dart';

@freezed
abstract class PokemonPokemon with _$PokemonPokemon {
  factory PokemonPokemon({
    @JsonKey(nullable: true, name: 'url') String url,
    @JsonKey(nullable: true, name: 'name') String name,
  }) = _PokemonPokemon;

  factory PokemonPokemon.fromJson(Map<String, dynamic> json) => _$PokemonPokemonFromJson(json);
}
