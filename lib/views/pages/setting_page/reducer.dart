import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/setting_page/action.dart';
import 'package:cryptotracker/views/pages/setting_page/state.dart';

Reducer<SettingPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<SettingPageState>>{
      SettingAction.action: _onAction,
    },
  );
}

SettingPageState _onAction(SettingPageState state, Action action) {
  final SettingPageState newState = state.clone();
  return newState;
}
