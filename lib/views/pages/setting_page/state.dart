import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/views/pages/global_store/state.dart';

class SettingPageState implements GlobalBaseState, Cloneable<SettingPageState> {
  @override
  SettingPageState clone() {
    return SettingPageState()
      ..currencyListData = currencyListData
      ..themeBlack = themeBlack;
  }

  @override
  bool themeBlack;

  @override
  EnCurrencyMarket currencyListData;
}

SettingPageState initState(Map<String, dynamic> args) {
  return SettingPageState();
}
