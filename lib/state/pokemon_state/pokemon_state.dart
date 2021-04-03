import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:rsj_f/rsj_f.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_state.freezed.dart';
part 'pokemon_state.g.dart';

@freezed
abstract class PokemonState with _$PokemonState {
  factory PokemonState({
    @JsonKey(name: 'pokemonInformation', ignore: true) Map<String, dynamic> pokemonInformation,
    @JsonKey(name: 'evolutionChain', ignore: true) Map<String, dynamic> evolutionChain,
    @JsonKey(name: 'filteredPokemonList', nullable: true) List<PokemonPokemon> filteredPokemons,
    @JsonKey(name: 'pokemons', nullable: true) List<PokemonPokemon> pokemons,
    @JsonKey(name: 'selectedPokemon', nullable: true) PokemonData selectedPokemon,
  }) = _PokemonState;

  factory PokemonState.init() => PokemonState(
        pokemons: List.empty(),
        filteredPokemons: List.empty(),
      );

  factory PokemonState.fromJson(Map<String, dynamic> json) => _$PokemonStateFromJson(json);
}
