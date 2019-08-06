import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/models/home.dart';
import 'package:cryptotracker/views/pages/global_store/state.dart';

/// 创建页面状态类，状态类必须实现Cloneable接口
class HomePageState implements GlobalBaseState, Cloneable<HomePageState> {
  bool isLoading = false;
  Home home = Home();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  HomePageState clone() {
    return HomePageState()
      ..home = home
      ..themeBlack = themeBlack
      ..isLoading = isLoading;
  }

  bool get isDataReady {
    return home.topics.isNotEmpty && home.sections.isNotEmpty;
  }

  @override
  bool themeBlack;

  @override
  EnCurrencyMarket currencyListData;
}

HomePageState initState(Map<String, dynamic> map) {
  return HomePageState()..isLoading = true;
}
