import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_flutter/apis/api_service.dart';
import 'package:pokedex_flutter/pokedex_app.dart';
import 'package:pokedex_flutter/state/app_state.dart';
import 'package:rsj_f/rsj_f.dart';

final getIt = GetIt.instance;

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  final persistor = StatePersistor<AppState>(
    StandardEngine(),
    AppStateSerializer(),
  );

  AppState? initialState;
  try {
    initialState = await persistor.readState();
  } catch (e) {
    print(e);
  }

  final store = Store<AppState>(
    initialState: initialState ?? AppState.init(),
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
    persistor: persistor,
  );

  getIt.registerLazySingleton<ApiService>(() => ApiService());

  runApp(PokedexApp(store: store));
}
