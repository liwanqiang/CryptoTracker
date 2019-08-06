import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/views/pages/mine_page/state.dart';

Widget buildView(
    MinePageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      //backgroundColor: state.themeColor,
      body: Center(
    child: Text(
      'Mine',
      //style: TextStyle(color: state.themeBlack),
    ),
  ));
}
