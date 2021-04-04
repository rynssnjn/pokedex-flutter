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
    @JsonKey(name: 'id') int id,
    @JsonKey(nullable: true, name: 'name') String name,
    @JsonKey(nullable: true, name: 'abilities') List<PokemonAbilities> abilities,
    @JsonKey(nullable: true, name: 'base_experience') int baseExperience,
    @JsonKey(nullable: true, name: 'forms') List<PokemonForm> forms,
    @JsonKey(nullable: true, name: 'height') int height,
    @JsonKey(nullable: true, name: 'type') String type,
    @JsonKey(nullable: true, name: 'is_default') bool isDefault,
    @JsonKey(nullable: true, name: 'location_area_encounters') String locationAreaEncounters,
    @JsonKey(nullable: true, name: 'moves') List<PokemonMoves> moves,
    @JsonKey(nullable: true, name: 'order') int order,
    @JsonKey(nullable: true, name: 'sprites') PokemonSprites sprites,
    @JsonKey(nullable: true, name: 'stats') List<PokemonStatistics> stats,
    @JsonKey(nullable: true, name: 'types') List<PokemonTypes> types,
    @JsonKey(nullable: true, name: 'weight') int weight,
  }) = _PokemonData;

  factory PokemonData.fromJson(Map<String, dynamic> json) => _$PokemonDataFromJson(json);
}
