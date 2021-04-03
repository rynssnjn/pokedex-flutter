import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_statistic.freezed.dart';
part 'pokemon_statistic.g.dart';

@freezed
abstract class PokemonStatistic with _$PokemonStatistic {
  factory PokemonStatistic({
    @JsonKey(nullable: true, name: 'name') String name,
    @JsonKey(nullable: true, name: 'value') int value,
  }) = _PokemonStatistic;

  factory PokemonStatistic.fromJson(Map<String, dynamic> json) => _$PokemonStatisticFromJson(json);
}
