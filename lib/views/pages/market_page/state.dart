import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/models/stock.dart';
import 'package:cryptotracker/views/pages/global_store/state.dart';

class MarketPageState implements GlobalBaseState, Cloneable<MarketPageState> {
  bool isLoading = false;
  //Market market = Market();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool get isDataReady {
    return currencyListData != null &&
        currencyListData.marketListData.isNotEmpty;
  }

  @override
  MarketPageState clone() {
    return MarketPageState()
      ..isLoading = isLoading
      ..currencyListData = currencyListData
      ..themeBlack = themeBlack;
  }

  @override
  bool themeBlack;

  @override
  EnCurrencyMarket currencyListData;
}

MarketPageState initState(Map<String, dynamic> args) {
  print('routes02 MarketPageState initState');
  return MarketPageState()
    //..currencyListData = EnCurrencyMarket()
    ..isLoading = true;
}
