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
