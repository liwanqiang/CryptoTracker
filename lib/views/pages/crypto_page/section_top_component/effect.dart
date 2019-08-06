import 'package:fish_redux/fish_redux.dart';
import 'action.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    DetailTopAction.action: _onAction,
  });
}

void _onAction(Action action, Context ctx) {}
