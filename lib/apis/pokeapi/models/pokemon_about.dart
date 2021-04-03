import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_about.freezed.dart';
part 'pokemon_about.g.dart';

@freezed
abstract class PokemonAbout with _$PokemonAbout {
  factory PokemonAbout({
    @JsonKey(nullable: true, name: 'name') String name,
    @JsonKey(nullable: true, name: 'value') String value,
  }) = _PokemonAbout;

  factory PokemonAbout.fromJson(Map<String, dynamic> json) => _$PokemonAboutFromJson(json);
}
