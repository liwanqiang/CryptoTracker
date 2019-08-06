import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/setting_page/action.dart';
import 'package:cryptotracker/views/pages/setting_page/state.dart';

Effect<SettingPageState> buildEffect() {
  return combineEffects(<Object, Effect<SettingPageState>>{
    Lifecycle.initState: _onInit,
    SettingAction.action: _onAction,
  });
}

void _onInit(Action action, Context<SettingPageState> ctx) {
  if (ctx.state.currencyListData == null) {
    print('setting ctx.state.currencyListData==null');
  } else {
    print(
        ' setting ctx.state.currencyListData.marketListData.length = ${ctx.state.currencyListData.marketListData.length}');
  }
}

void _onAction(Action action, Context<SettingPageState> ctx) {}
