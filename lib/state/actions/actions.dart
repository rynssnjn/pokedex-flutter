import 'package:pokedex_flutter/state/app_state.dart';
import 'package:rsj_f/rsj_f.dart';

/// Saves last loaded localization date to state
class SetLocalizationDateLoaded extends ReduxAction<AppState> {
  final DateTime date;

  SetLocalizationDateLoaded(this.date);

  @override
  AppState reduce() {
    return state.copyWith(localizationLastLoadedOn: date);
  }
}
