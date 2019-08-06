import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/views/pages/global_store/state.dart';

class MainPageState implements GlobalBaseState, Cloneable<MainPageState> {
  MaterialColor color;
  var index = 0;
  String title;

  @override
  MainPageState clone() {
    MainPageState newState = MainPageState()
      ..color = color
      ..title = title
      ..themeBlack = themeBlack
      ..index = index;
    return newState;
  }

  @override
  bool themeBlack;

  @override
  EnCurrencyMarket currencyListData;
}

MainPageState initState(Map<String, dynamic> args) {
  return MainPageState()
    ..color = Colors.blue
    ..index = 0
    ..title = "首页";
}
