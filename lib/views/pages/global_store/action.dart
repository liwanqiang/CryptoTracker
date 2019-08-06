import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/crypto.dart';

enum GlobalAction { changeThemeColor, updateData, init }

class GlobalActionCreator {
  static Action onchangeThemeColor() {
    return Action(GlobalAction.changeThemeColor);
  }

  static Action onUpdateData(EnCurrencyMarket currency) {
    print('action-onUpdateData');
    return Action(GlobalAction.updateData, payload: currency);
  }
}
