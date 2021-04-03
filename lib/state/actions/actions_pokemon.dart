import 'package:pokedex_flutter/apis/api_service.dart';
import 'package:pokedex_flutter/state/actions/actions.dart';
import 'package:pokedex_flutter/state/app_state.dart';
import 'package:pokedex_flutter/utilities/app_starter.dart';
import 'package:dartx/dartx.dart';

/// Gets all pokemon on paginated style.
class GetPokemonsAction extends LoadingAction<AppState> {
  GetPokemonsAction({this.offset = 0}) : super(actionKey: key);

  static const key = 'get-pokemons';

  final int offset;

  @override
  bool abortDispatch() => state.wait?.isWaitingFor(key) == true;

  @override
  Future<AppState> reduce() async {
    final pagination = await getIt<ApiService>().pokemonApi.getAll(offset: offset);
    final pokemons = [
      ...state.pokemonState.pokemons,
      ...pagination.results,
    ];
    final pokemonState = state.pokemonState.copyWith(pokemons: pokemons.toUnmodifiable());

    return state.copyWith(
      pagination: pagination,
      pokemonState: pokemonState,
    );
  }
}

/// Gets data of the selected pokemon
class GetPokemonDataAction extends LoadingAction<AppState> {
  static const key = 'get-pokemon-data';

  GetPokemonDataAction(this.id) : super(actionKey: key);

  final int id;

  @override
  Future<AppState> reduce() async {
    final pokemon = await getIt<ApiService>().pokemonApi.getById(id);

    return state.copyWith.pokemonState(selectedPokemon: pokemon);
  }
}
