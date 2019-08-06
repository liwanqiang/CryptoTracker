import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:cryptotracker/views/pages/main_page/action.dart';
import 'package:cryptotracker/views/pages/main_page/state.dart';

Reducer<MainPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainPageState>>{
      MainAction.switchTheme: _onAction,
      MainAction.switchIndex: _switchIndex,
      MainAction.changeTitle: _changeTitle,
    },
  );
}

MainPageState _onAction(MainPageState state, Action action) {
  MaterialColor color =
      state.color == Colors.green ? Colors.blue : Colors.green;
  final MainPageState newState = state.clone()..color = color;
  return newState;
}

MainPageState _changeTitle(MainPageState state, Action action) {
  final MainPageState newState = state.clone()..title = action.payload;
  return newState;
}

MainPageState _switchIndex(MainPageState state, Action action) {
  var index = action.payload;
  String title;
  if (index == 0) {
    title = "首页";
  } else if (index == 1) {
    title = "虚拟货币";
  } else {
    title = "我的";
  }

  MainPageState newState = state.clone()
    ..index = index
    ..title = title;
  return newState;
}
