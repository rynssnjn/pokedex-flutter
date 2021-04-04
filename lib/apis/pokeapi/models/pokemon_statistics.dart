import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_stats.dart';

part 'pokemon_statistics.freezed.dart';
part 'pokemon_statistics.g.dart';

@freezed
abstract class PokemonStatistics with _$PokemonStatistics {
  factory PokemonStatistics({
    @JsonKey(nullable: true, name: 'base_stat') int baseState,
    @JsonKey(nullable: true, name: 'effort') int effort,
    @JsonKey(nullable: true, name: 'stat') PokemonStats stats,
  }) = _PokemonStatistics;

  factory PokemonStatistics.fromJson(Map<String, dynamic> json) => _$PokemonStatisticsFromJson(json);
}
