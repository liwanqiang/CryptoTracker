import 'dart:ui';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/models/crypto.dart';

abstract class GlobalBaseState {
  bool get themeBlack;
  set themeBlack(bool black);
  EnCurrencyMarket get currencyListData;
  set currencyListData(EnCurrencyMarket currency);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  bool themeBlack;

  GlobalState() {
    themeBlack = true;
    print('routes03 GlobalState()');
    currencyListData = EnCurrencyMarket();
  }

  @override
  GlobalState clone() {
    return GlobalState()
      ..themeBlack = themeBlack
      ..currencyListData = currencyListData;
  }

  @override
  EnCurrencyMarket currencyListData;
}
