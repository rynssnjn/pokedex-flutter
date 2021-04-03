import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_flutter/state/app_state.dart';
import 'package:pokedex_flutter/utilities/app_router.dart';
import 'package:pokedex_flutter/utilities/theme.dart';
import 'package:rsj_f/rsj_f.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: pokedexTheme,
        home: WillPopScope(
          onWillPop: () async => !await mainNavigatorKey.currentState.maybePop(),
          child: UserExceptionWidget<AppState>(
            requestFlushbar: (key, bContext) => RSJFlushBar(
              title: key,
              message: key,
            ),
            child: Navigator(
              key: mainNavigatorKey,
              initialRoute: PokemonListConnector.route,
              onGenerateRoute: AppRouter.generateRoute,
            ),
          ),
        ),
      ),
    );
  }
}
