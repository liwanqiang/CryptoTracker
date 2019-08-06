import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

final Map oHLCVWidthOptions = {
  "1h": [
    ["1m", 60, 1, "minute"],
    ["2m", 30, 2, "minute"],
    ["3m", 20, 3, "minute"]
  ],
  "6h": [
    ["5m", 72, 5, "minute"],
    ["10m", 36, 10, "minute"],
    ["15m", 24, 15, "minute"]
  ],
  "12h": [
    ["10m", 72, 10, "minute"],
    ["15m", 48, 15, "minute"],
    ["30m", 24, 30, "minute"]
  ],
  "24h": [
    ["15m", 96, 15, "minute"],
    ["30m", 48, 30, "minute"],
    ["1h", 24, 1, "hour"]
  ],
  "3D": [
    ["1h", 72, 1, "hour"],
    ["2h", 36, 2, "hour"],
    ["4h", 18, 4, "hour"]
  ],
  "7D": [
    ["2h", 86, 2, "hour"],
    ["4h", 42, 4, "hour"],
    ["6h", 28, 6, "hour"]
  ],
  "1M": [
    ["12h", 60, 12, "hour"],
    ["1D", 30, 1, "day"]
  ],
  "3M": [
    ["1D", 90, 1, "day"],
    ["2D", 45, 2, "day"],
    ["3D", 30, 3, "day"]
  ],
  "6M": [
    ["2D", 90, 2, "day"],
    ["3D", 60, 3, "day"],
    ["7D", 26, 7, "day"]
  ],
  "1Y": [
    ["7D", 52, 7, "day"],
    ["14D", 26, 14, "day"]
  ],
};

Effect<CryptoDetailState> buildEffect() {
  return combineEffects(<Object, Effect<CryptoDetailState>>{
    Lifecycle.initState: _onInit,
    //StockAction.onFetch: _onFetch,
  });
}

void _onInit(Action action, Context<CryptoDetailState> ctx) async {
  String historyTotal = "24h";
  int currentOHLCVWidthSetting = 0;
  //String e;
  var response = await http.get(
      Uri.encodeFull("https://min-api.cryptocompare.com/data/histo" +
          oHLCVWidthOptions[historyTotal][currentOHLCVWidthSetting][3] +
          "?fsym=" +
          ctx.state.crypto.symbol +
          //exchangeData["FROMSYMBOL"] +
          "&tsym=USD&limit=" +
          (oHLCVWidthOptions[historyTotal][currentOHLCVWidthSetting][1] - 1)
              .toString() +
          "&aggregate=" +
          oHLCVWidthOptions[historyTotal][currentOHLCVWidthSetting][2]
              .toString()),
      headers: {"Accept": "application/json"});
  List historyOHLCV = JsonDecoder().convert(response.body)["Data"];
  ctx.dispatch(CryptoDetailActionCreator.didLoadAction(historyOHLCV));
}
