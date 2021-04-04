import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_data/pokemon_data_connector.dart';
import 'package:pokedex_flutter/features/pokemon_list/widgets/pokemon_list_item.dart';
import 'package:pokedex_flutter/models/async.dart';
import 'package:pokedex_flutter/state/actions/actions_pokemon.dart';
import 'package:pokedex_flutter/state/app_state.dart';
import 'package:pokedex_flutter/utilities/colors.dart';
import 'package:pokedex_flutter/utilities/constants.dart';
import 'package:rsj_f/rsj_f.dart';

class _PokemonListVM extends BaseModel<AppState> {
  _PokemonListVM();

  _PokemonListVM.build({
    this.loadNextPage,
    this.pokemons,
  }) : super(equals: [pokemons]);

  Async<List<PokemonPokemon>> pokemons;
  Future<void> Function() loadNextPage;

  @override
  BaseModel fromStore() {
    return _PokemonListVM.build(
      loadNextPage: _loadNextPage,
      pokemons: _getPokemons(),
    );
  }

  Async<List<PokemonPokemon>> _getPokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key) && state.pokemonState.pokemons?.isEmpty == true) {
      return Async.loading();
    } else if (state.pokemonState.pokemons?.isNotEmpty == true) {
      return Async(state.pokemonState.pokemons);
    } else {
      return Async.error('error');
    }
  }

  Future<void> _loadNextPage() async {
    final uri = Uri(path: state.pagination.next);
    final parameters = uri.pathSegments.last.replaceAll('?', '').split('&');
    final offset = parameters.first.split('=').last.toInt();
    await dispatchFuture(GetPokemonsAction(offset: offset));
  }
}

class PokemonListConnector extends StatelessWidget {
  static const route = 'pokemon-list-page';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _PokemonListVM>(
      model: _PokemonListVM(),
      onInit: (store) => store.dispatch(GetPokemonsAction()),
      builder: (context, vm) => _PokemonListWidget(
        loadNextPage: vm.loadNextPage,
        pokemons: vm.pokemons,
      ),
    );
  }
}

class _PokemonListWidget extends StatelessWidget {
  const _PokemonListWidget({
    @required this.loadNextPage,
    this.pokemons,
  });

  final Async<List<PokemonPokemon>> pokemons;
  final Future<void> Function() loadNextPage;

  void _navigateToPokemonDataPage(BuildContext context, int id) {
    Navigator.pushNamed(
      context,
      PokemonDataConnector.route,
      arguments: PokemonDataArgs(id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightOrange,
        title: Text(
          appTitle,
          style: textTheme.headline4,
        ),
      ),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            final currentScroll = scrollInfo.metrics.pixels;
            final maxScroll = scrollInfo.metrics.maxScrollExtent;
            if (currentScroll >= maxScroll) {
              loadNextPage();
            }
            return false;
          },
          child: pokemons.when(
            (pokemons) => GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              shrinkWrap: true,
              childAspectRatio: 1.4,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: pokemons
                  .mapIndexed((index, pokemon) => PokemonListItem(
                        onTap: () => _navigateToPokemonDataPage(context, index + 1),
                        name: pokemon.name.toUpperCase(),
                        imageUrl: imageURL.replaceAll('%s', (index + 1).toString()),
                      ))
                  .toUnmodifiable(),
            ),
            loading: () => Center(
              child: RSJCircularIndicator(size: 30),
            ),
            error: (key) => Center(child: Text(key)),
          ),
        ),
      ),
    );
  }
}
