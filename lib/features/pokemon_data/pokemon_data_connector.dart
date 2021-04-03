import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/data_header.dart';
import 'package:pokedex_flutter/models/async.dart';
import 'package:pokedex_flutter/state/actions/actions_pokemon.dart';
import 'package:pokedex_flutter/state/app_state.dart';
import 'package:pokedex_flutter/utilities/colors.dart';
import 'package:pokedex_flutter/widgets/pokedex_circular_indicator.dart';
import 'package:pokedex_flutter/utilities/extensions.dart';
import 'package:rsj_f/rsj_f.dart';

class _PokemonDataVM extends BaseModel<AppState> {
  _PokemonDataVM();

  _PokemonDataVM.build({
    this.getPokemon,
    this.pokemon,
  }) : super(equals: [getPokemon, pokemon]);

  Async<PokemonData> getPokemon;
  PokemonData pokemon;

  @override
  BaseModel fromStore() {
    return _PokemonDataVM.build(
      getPokemon: _getPokemon(),
      pokemon: _pokemon,
    );
  }

  PokemonData get _pokemon => state.pokemonState.selectedPokemon;

  Async<PokemonData> _getPokemon() {
    if (state.wait?.isWaitingFor(GetPokemonDataAction.key) == true) {
      return Async.loading();
    } else if (_pokemon != null) {
      return Async(_pokemon);
    } else {
      return Async.error('error');
    }
  }
}

class PokemonDataArgs {
  const PokemonDataArgs({this.id});

  final int id;
}

class PokemonDataConnector extends StatefulWidget {
  static const route = 'pokemon-data-page';

  const PokemonDataConnector({@required this.args});

  final PokemonDataArgs args;

  @override
  _PokemonDataConnectorState createState() => _PokemonDataConnectorState();
}

class _PokemonDataConnectorState extends State<PokemonDataConnector> {
  Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _PokemonDataVM>(
      model: _PokemonDataVM(),
      onDidChange: (vm) => setState(() => backgroundColor = vm.pokemon.typeColor),
      onInit: (store) => store.dispatch(GetPokemonDataAction(widget.args.id)),
      builder: (context, vm) => _PokemonDataWidget(
        getPokemon: vm.getPokemon,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class _PokemonDataWidget extends StatelessWidget {
  const _PokemonDataWidget({
    this.getPokemon,
    this.backgroundColor,
  });

  final Async<PokemonData> getPokemon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor ?? lightOrange,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: getPokemon.when(
          (pokemon) => Column(
            children: [
              DataHeader(
                backgroundColor: pokemon.typeColor,
                name: pokemon.name.toUpperCase(),
                id: pokemon.idValue,
                imageURL: pokemon.sprites.frontDefault,
                types: pokemon.types.map((e) => e.type).toUnmodifiable(),
              ),
            ],
          ),
          loading: () => Center(child: PokedexCircularIndicator(size: 30)),
          error: (key) => Text(key),
        ),
      ),
    );
  }
}
