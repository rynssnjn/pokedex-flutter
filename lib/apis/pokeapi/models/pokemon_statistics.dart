import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_stats.dart';

part 'pokemon_statistics.freezed.dart';
part 'pokemon_statistics.g.dart';

@freezed
abstract class PokemonStatistics with _$PokemonStatistics {
  factory PokemonStatistics({
    @JsonKey(name: 'base_stat') int? baseState,
    @JsonKey(name: 'effort') int? effort,
    @JsonKey(name: 'stat') PokemonStats? stats,
  }) = _PokemonStatistics;

  factory PokemonStatistics.fromJson(Map<String, dynamic> json) => _$PokemonStatisticsFromJson(json);
}
