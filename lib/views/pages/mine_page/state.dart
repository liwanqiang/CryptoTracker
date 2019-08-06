import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/views/pages/global_store/state.dart';

class MinePageState implements GlobalBaseState, Cloneable<MinePageState> {
  @override
  MinePageState clone() {
    return MinePageState()..themeBlack = themeBlack;
  }

  @override
  bool themeBlack;

  @override
  EnCurrencyMarket currencyListData;
}

MinePageState initState(Map<String, dynamic> args) {
  return MinePageState();
}
