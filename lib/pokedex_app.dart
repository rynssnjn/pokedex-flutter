import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex_flutter/state/actions/actions.dart';
import 'package:pokedex_flutter/state/app_state.dart';
import 'package:pokedex_flutter/utilities/app_router.dart';
import 'package:pokedex_flutter/utilities/localization_util.dart';
import 'package:pokedex_flutter/utilities/theme.dart';
import 'package:rsj_f/rsj_f.dart';

class PokedexApp extends StatefulWidget {
  const PokedexApp({this.store});

  final Store<AppState> store;

  @override
  _PokedexAppState createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  LocalizationUtil _localizationUtil;
  TranslationsDelegate _delegate;

  @override
  void initState() {
    _localizationUtil = LocalizationUtil()
      ..initLocalization(
        initialLocale: Locale('en'),
        savedLastOnCallback: (date) => widget.store.dispatch(SetLocalizationDateLoaded(date)),
        localizationLastLoadedOn: widget.store.state.localizationLastLoadedOn,
        translationDelegateChanged: (delegate) => setState(() => _delegate = delegate),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        theme: pokedexTheme,
        home: UserExceptionWidget<AppState>(
          requestFlushbar: (key, bContext) => RSJFlushBar(
            title: key,
            message: key,
          ),
          child: WillPopScope(
            onWillPop: () async => !await mainNavigatorKey.currentState.maybePop(),
            child: Navigator(
              key: mainNavigatorKey,
              initialRoute: PokemonListConnector.route,
              onGenerateRoute: AppRouter.generateRoute,
            ),
          ),
        ),
        localizationsDelegates: [
          _delegate ?? _localizationUtil.translationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: _localizationUtil.appLanguages.supportedLocales() ?? [],
      ),
    );
  }
}
