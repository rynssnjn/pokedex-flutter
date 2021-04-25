import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stats.freezed.dart';
part 'pokemon_stats.g.dart';

@freezed
abstract class PokemonStats with _$PokemonStats {
  factory PokemonStats({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'value') int? value,
  }) = _PokemonStats;

  factory PokemonStats.fromJson(Map<String, dynamic> json) => _$PokemonStatsFromJson(json);
}
