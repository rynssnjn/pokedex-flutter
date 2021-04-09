import 'package:flutter/material.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_ability.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_data.dart';
import 'package:pokedex_flutter/apis/pokeapi/models/pokemon_evolution.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/about/about_container.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/bottom_bar_indicator.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/data_header.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/evolution/evolution_container.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/moves/moves_container.dart';
import 'package:pokedex_flutter/features/pokemon_data/widgets/stats/stats_container.dart';
import 'package:pokedex_flutter/models/async.dart';
import 'package:pokedex_flutter/state/actions/actions_pokemon.dart';
import 'package:pokedex_flutter/state/app_state.dart';
import 'package:pokedex_flutter/utilities/colors.dart';
import 'package:pokedex_flutter/utilities/extensions.dart';
import 'package:pokedex_flutter/utilities/string_constants.dart';
import 'package:rsj_f/rsj_f.dart';

class _PokemonDataVM extends BaseModel<AppState> {
  _PokemonDataVM();

  _PokemonDataVM.build({
    this.getPokemon,
    this.pokemon,
    this.getEvolution,
  }) : super(equals: [getPokemon, getEvolution, pokemon]);

  Async<PokemonData> getPokemon;
  Async<PokemonEvolution> getEvolution;
  PokemonData pokemon;

  @override
  BaseModel fromStore() {
    return _PokemonDataVM.build(
      getPokemon: _getPokemon(),
      getEvolution: _getEvolution(),
      pokemon: _pokemon,
    );
  }

  PokemonData get _pokemon => state.pokemonState.selectedPokemon;
  PokemonEvolution get _evolution => state.pokemonState.selectedEvolution;

  Async<PokemonData> _getPokemon() {
    if (state.wait?.isWaitingFor(GetPokemonDataAction.key) == true) {
      return Async.loading();
    } else if (_pokemon != null) {
      return Async(_pokemon);
    } else {
      return Async.error(generalError);
    }
  }

  Async<PokemonEvolution> _getEvolution() {
    if (state.wait?.isWaitingFor(GetEvolutionChain.key) == true) {
      return Async.loading();
    } else if (_evolution != null) {
      return Async(_evolution);
    } else {
      return Async.error(generalError);
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
      onInit: (store) {
        store.dispatch(GetPokemonDataAction(widget.args.id));
        store.dispatch(GetEvolutionChain(widget.args.id));
      },
      builder: (context, vm) => _PokemonDataWidget(
        getPokemon: vm.getPokemon,
        getEvolution: vm.getEvolution,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class _PokemonDataWidget extends StatefulWidget {
  const _PokemonDataWidget({
    this.getPokemon,
    this.getEvolution,
    this.backgroundColor,
  });

  final Async<PokemonData> getPokemon;
  final Async<PokemonEvolution> getEvolution;
  final Color backgroundColor;

  @override
  _PokemonDataWidgetState createState() => _PokemonDataWidgetState();
}

class _PokemonDataWidgetState extends State<_PokemonDataWidget> {
  PageController controller;
  int currentIndex;

  @override
  void initState() {
    controller = PageController(initialPage: 0)..addListener(() => setState(() {}));
    currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String _getFormattedAbilities(List<PokemonAbility> abilities) {
    final s = abilities.map((e) => e.name.capitalize()).toUnmodifiable();
    return s.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.backgroundColor ?? appBarDefault,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: widget.getPokemon.when(
          (pokemon) => Column(
            children: [
              DataHeader(
                backgroundColor: pokemon.typeColor,
                name: pokemon.name.toUpperCase(),
                id: pokemon.idValue,
                imageURL: pokemon.sprites.frontDefault,
                types: pokemon.types.map((e) => e.type).toUnmodifiable(),
              ),
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: controller,
                      onPageChanged: (index) => setState(() => currentIndex = index),
                      children: [
                        AboutContainer(
                          height: pokemon.height,
                          weight: pokemon.weight,
                          baseExperience: pokemon.baseExperience,
                          abilities: _getFormattedAbilities(pokemon.abilities.map((e) => e.ability).toUnmodifiable()),
                          decorationColor: widget.backgroundColor,
                        ),
                        StatsContainer(
                          stats: pokemon.stats,
                          decorationColor: widget.backgroundColor,
                        ),
                        widget.getEvolution.when(
                          (evolution) => EvolutionContainer(
                            evolution: evolution,
                            titleColor: widget.backgroundColor,
                          ),
                          loading: () => Center(child: RSJCircularIndicator(size: 30)),
                          error: (key) => Text(key.localized(context)),
                        ),
                        MovesContainer(
                          moves: pokemon.moves.map((e) => e.move.name).toUnmodifiable(),
                          titleColor: widget.backgroundColor,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomBarIndicator(
                        controller: controller,
                        pageIndicator: widget.backgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          loading: () => Center(child: RSJCircularIndicator(size: 30)),
          error: (key) => Text(key.localized(context)),
        ),
      ),
    );
  }
}
