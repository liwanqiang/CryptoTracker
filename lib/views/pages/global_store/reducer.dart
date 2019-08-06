import 'dart:ui';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/views/pages/global_store/action.dart';
import 'package:cryptotracker/views/pages/global_store/state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
      GlobalAction.updateData: _onUpdateData,
      Lifecycle.initState: _init,
    },
  );
}

List<Color> _colors = <Color>[
  Colors.green,
  Colors.red,
  Colors.grey,
  Colors.blue
];

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
//  final Color next =
//      _colors[((_colors.indexOf(state.themeBlack) + 1) % _colors.length)];
  return state.clone()..themeBlack = !state.themeBlack;
}

GlobalState _init(GlobalState state, Action action) {
  GlobalState newState = state.clone();
  newState.themeBlack = true;
  print('************************* global _init =======================');
  return newState;
}

GlobalState _onUpdateData(GlobalState state, Action action) {
  EnCurrencyMarket currencyListData = action.payload;
  return state.clone()..currencyListData = currencyListData;
}
