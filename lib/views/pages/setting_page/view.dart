import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/views/pages/setting_page/state.dart';

Widget buildView(
    SettingPageState state, Dispatch dispatch, ViewService viewService) {
  if (state.currencyListData == null) {
    print('setting ctx.state.currencyListData==null');
  } else {
    print(
        ' setting ctx.state.currencyListData.marketListData.length = ${state.currencyListData.marketListData.length}');
  }
  return Scaffold(
    //backgroundColor: state.themeColor,
    body: Center(
      child: Text('Setting'),
    ),
  );
}
