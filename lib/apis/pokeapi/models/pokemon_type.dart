import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
abstract class PokemonType with _$PokemonType {
  factory PokemonType({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
}
