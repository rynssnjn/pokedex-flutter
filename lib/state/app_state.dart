import 'package:pokedex_flutter/apis/pokeapi/models/pagination_pokemon.dart';
import 'package:pokedex_flutter/state/pokemon_state/pokemon_state.dart';
import 'package:rsj_f/rsj_f.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState {
  factory AppState({
    @JsonKey(name: 'pagination', ignore: true) PaginationPokemon pagination,
    @JsonKey(name: 'wait', ignore: true) Wait wait,
    @required @JsonKey(name: 'pokemonState') PokemonState pokemonState,
  }) = _AppState;

  factory AppState.init() => AppState(
        pokemonState: PokemonState.init(),
        wait: Wait(),
      );

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}

class AppStateSerializer extends StateSerializer<AppState> {
  @override
  AppState decode(Map<String, dynamic> data) => AppState.fromJson(data);

  @override
  Map<String, dynamic> encode(state) => state.toJson();
}
