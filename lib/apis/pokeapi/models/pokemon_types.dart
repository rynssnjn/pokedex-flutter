import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_type.dart';

part 'pokemon_types.freezed.dart';
part 'pokemon_types.g.dart';

@freezed
abstract class PokemonTypes with _$PokemonTypes {
  factory PokemonTypes({
    @JsonKey(name: 'slot') int? slot,
    @JsonKey(name: 'type') PokemonType? type,
  }) = _PokemonTypes;

  factory PokemonTypes.fromJson(Map<String, dynamic> json) => _$PokemonTypesFromJson(json);
}
