import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_form.freezed.dart';
part 'pokemon_form.g.dart';

@freezed
abstract class PokemonForm with _$PokemonForm {
  factory PokemonForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _PokemonForm;

  factory PokemonForm.fromJson(Map<String, dynamic> json) => _$PokemonFormFromJson(json);
}
