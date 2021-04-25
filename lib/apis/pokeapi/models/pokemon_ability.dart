import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_ability.freezed.dart';
part 'pokemon_ability.g.dart';

@freezed
abstract class PokemonAbility with _$PokemonAbility {
  factory PokemonAbility({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'type') String? type,
  }) = _PokemonAbility;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => _$PokemonAbilityFromJson(json);
}
