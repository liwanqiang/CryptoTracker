import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/main_page/action.dart';
import 'package:cryptotracker/views/pages/main_page/state.dart';

Effect<MainPageState> buildEffect() {
  return combineEffects(<Object, Effect<MainPageState>>{
    MainAction.changeTitle: _changeTitle,
    //MainAction.switchIndex: _switchIndex,
  });
}

void _switchIndex(Action action, Context<MainPageState> ctx) {
  print("MainPage switchIndex");
  ctx.dispatch(Action(MainAction.switchIndex, payload: action.payload));
}

void _changeTitle(Action action, Context<MainPageState> ctx) {
  ctx.dispatch(MainActionCreator.changeTitle(action.payload));
}
