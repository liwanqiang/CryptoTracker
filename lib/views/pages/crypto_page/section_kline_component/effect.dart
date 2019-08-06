import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    KLineAction.action: _onAction,
  });
}

void _onAction(Action action, Context ctx) {}
