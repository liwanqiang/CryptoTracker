import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/models/crypto.dart';

class CryptoDetailState implements Cloneable<CryptoDetailState> {
  List history = [];
  bool isLoading = false;
  Color themeColor;
  Crypto crypto;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  CryptoDetailState clone() {
    return CryptoDetailState()
      ..history = history
      ..themeColor = themeColor
      ..isLoading = isLoading
      ..crypto = crypto;
  }
}

CryptoDetailState initState(Map<String, dynamic> args) {
  Crypto crypto = args['symbol'];
  Color themeColor = args['themeColor'];
  return CryptoDetailState()
    ..crypto = crypto
    ..themeColor = themeColor
    ..isLoading = true;
}
