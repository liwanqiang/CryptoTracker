import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/mine_page/state.dart';
import 'package:cryptotracker/views/pages/mine_page/action.dart';

Reducer<MinePageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MinePageState>>{
      MinePageAction.action: _onAction,
    },
  );
}

MinePageState _onAction(MinePageState state, Action action) {
  final MinePageState newState = state.clone();
  return newState;
}
