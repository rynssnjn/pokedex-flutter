import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:rsj_f/rsj_f.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState {
  factory AppState({
    @JsonKey(name: 'pokemonList', ignore: true) List<PokemonPokemon> pokemonList,
    @JsonKey(name: 'pokemonInformation', ignore: true) Map<String, dynamic> pokemonInformation,
    @JsonKey(name: 'evolutionChain', ignore: true) Map<String, dynamic> evolutionChain,
    @JsonKey(name: 'filteredPokemonList', ignore: true) List<PokemonPokemon> filteredPokemonList,
    @JsonKey(name: 'wait', ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.init() => AppState(wait: Wait());

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}

class AppStateSerializer extends StateSerializer<AppState> {
  @override
  AppState decode(Map<String, dynamic> data) => AppState.fromJson(data);

  @override
  Map<String, dynamic> encode(state) => state.toJson();
}
