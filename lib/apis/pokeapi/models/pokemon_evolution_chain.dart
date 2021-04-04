import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_evolution_chain.freezed.dart';
part 'pokemon_evolution_chain.g.dart';

@freezed
abstract class PokemonEvolutionChain with _$PokemonEvolutionChain {
  factory PokemonEvolutionChain({
    @JsonKey(nullable: true, name: 'url') String url,
  }) = _PokemonEvolutionChain;

  factory PokemonEvolutionChain.fromJson(Map<String, dynamic> json) => _$PokemonEvolutionChainFromJson(json);
}
