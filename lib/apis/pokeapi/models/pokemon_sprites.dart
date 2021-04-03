import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sprites.freezed.dart';
part 'pokemon_sprites.g.dart';

@freezed
abstract class PokemonSprites with _$PokemonSprites {
  factory PokemonSprites({
    @JsonKey(nullable: true, name: 'back_default') String backDefault,
    @JsonKey(nullable: true, name: 'back_female') String backFemale,
    @JsonKey(nullable: true, name: 'back_shiny') String backShiny,
    @JsonKey(nullable: true, name: 'back_shiny_female') String backShinyFemale,
    @JsonKey(nullable: true, name: 'front_default') String frontDefault,
    @JsonKey(nullable: true, name: 'front_female') String frontFemale,
    @JsonKey(nullable: true, name: 'front_shiny') String frontShiny,
    @JsonKey(nullable: true, name: 'front_shiny_female') String frontShinyFemale,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => _$PokemonSpritesFromJson(json);
}
