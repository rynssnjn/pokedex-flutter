import 'package:flutter/material.dart';
import 'package:pokedex_flutter/state/app_state.dart';
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
      ),
    );
  }
}
