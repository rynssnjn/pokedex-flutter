import 'package:pokedex_flutter/state/app_state.dart';
import 'package:rsj_f/rsj_f.dart';

/// Reusable loading page state for request action
abstract class LoadingAction<St> extends RequestAction<St> {
  LoadingAction({this.actionKey});
  final String actionKey;

  @override
  void before() => dispatch(WaitAction.add(actionKey));

  @override
  void after() => dispatch(WaitAction.remove(actionKey));
}

/// Saves last loaded localization date to state
class SetLocalizationDateLoaded extends ReduxAction<AppState> {
  final DateTime date;

  SetLocalizationDateLoaded(this.date);

  @override
  AppState reduce() {
    return state.copyWith(localizationLastLoadedOn: date);
  }
}
