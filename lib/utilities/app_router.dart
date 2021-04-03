import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokemon_data/pokemon_data_connector.dart';
import 'package:pokedex_flutter/features/pokemon_list/pokemon_list_connector.dart';

final mainNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PokemonListConnector.route:
        return MaterialPageRoute<dynamic>(builder: (_) => PokemonListConnector());
      case PokemonDataConnector.route:
        final args = settings.arguments as PokemonDataArgs;
        return MaterialPageRoute<dynamic>(builder: (_) => PokemonDataConnector(args: args));
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
        );
    }
  }
}
