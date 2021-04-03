import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_ability.dart';

part 'pokemon_abilities.freezed.dart';
part 'pokemon_abilities.g.dart';

@freezed
abstract class PokemonAbilities with _$PokemonAbilities {
  factory PokemonAbilities({
    @JsonKey(nullable: true, name: 'ability') PokemonAbility ability,
    @JsonKey(nullable: true, name: 'slot') int name,
    @JsonKey(nullable: true, name: 'is_hidden') bool type,
  }) = _PokemonAbilities;

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) => _$PokemonAbilitiesFromJson(json);
}
