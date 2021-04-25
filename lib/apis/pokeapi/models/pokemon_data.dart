import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_abilities.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_form.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_moves.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_sprites.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_statistics.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_types.dart';

part 'pokemon_data.freezed.dart';
part 'pokemon_data.g.dart';

@freezed
abstract class PokemonData with _$PokemonData {
  factory PokemonData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'abilities') List<PokemonAbilities>? abilities,
    @JsonKey(name: 'base_experience') int? baseExperience,
    @JsonKey(name: 'forms') List<PokemonForm>? forms,
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'is_default') bool? isDefault,
    @JsonKey(name: 'location_area_encounters') String? locationAreaEncounters,
    @JsonKey(name: 'moves') List<PokemonMoves>? moves,
    @JsonKey(name: 'order') int? order,
    @JsonKey(name: 'sprites') PokemonSprites? sprites,
    @JsonKey(name: 'stats') List<PokemonStatistics>? stats,
    @JsonKey(name: 'types') List<PokemonTypes>? types,
    @JsonKey(name: 'weight') int? weight,
  }) = _PokemonData;

  factory PokemonData.fromJson(Map<String, dynamic> json) => _$PokemonDataFromJson(json);
}
