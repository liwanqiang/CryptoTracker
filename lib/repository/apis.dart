import 'dart:convert';
import 'dart:io';

import 'package:gbk2utf8/gbk2utf8.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/models/home.dart';
import 'package:http/http.dart' as http;
import 'package:cryptotracker/models/stock.dart';
import 'package:cryptotracker/others/utils/datautils.dart';

class Apis {
  static const String BASE_URL = "http://111.231.243.232/";

  static Future<Home> getMovieHome() async {
    Future getTopics = http.get("$BASE_URL/topics");
    Future getSections = http.get("$BASE_URL/videos");

    List<http.Response> responseData =
        await Future.wait([getTopics, getSections]);

    Map topics = json.decode(responseData.first.body);
    Map sections = json.decode(responseData.last.body);

    Home home = Home();
    home.sections = (sections["data"] as List)
        .map((v) => VideoSection.fromJson(v))
        .toList();
    home.topics =
        (topics["data"] as List).map((v) => Topic.fromJson(v)).toList();
    return home;
  }

  static Future<Market> getStockMarket() async {
    String url =
        "http://hq.sinajs.cn/list=sh601003,sh601001,sz300459,sz300222,sh603456,sz002736,sh600570,sz300104,sz000416,"
        "sh600519,sz000001,sh601857,sz000333,sz000068,sz000651,sz002415,sz000651,sz300033,sz000418,sz000003,sz000005,"
        "sz000006,sz000007,sz000008,sz300252,sz000010,sz000011,sz000012,sz000013,sz000014,sz000015,sz000016,sz000017";
    http.Response response = await http.get(url);
    String str = decodeGbk(response.bodyBytes);
    Market market = Market();

    List<String> stockStrings = str.split(";");

    for (int i = 0; i < (stockStrings.length - 1); i++) {
      String str = stockStrings[i];
      Stock stock = Stock();
      market.stocks.add(DealStocks(str, stock));
    }

    return market;
  }

  static Future<EnCurrencyMarket> getEncryptedCurrencyMarket() async {
    int numberOfCoins = 20;
    EnCurrencyMarket marketListData = EnCurrencyMarket();

    Future<Null> _pullData(start, limit) async {
      var response = await http.get(
          Uri.encodeFull("https://api.coinmarketcap.com/v2/ticker/" +
              "?start=" +
              start.toString() +
              "&limit=" +
              limit.toString()),
          headers: {"Accept": "application/json"});
      Map rawMarketListData = JsonDecoder().convert(response.body)["data"];
      rawMarketListData.values.forEach((coin) {
        marketListData.marketListData.add(Crypto.fromMap(coin));
      });
    }

    List<Future> futures = [];
    for (int i = 0; i <= numberOfCoins / 10 - 1; i++) {
      int start = i * 10 + 1;
      int limit = i * 10 + 10;
      futures.add(_pullData(start, limit));
    }
    await Future.wait(futures);
    getApplicationDocumentsDirectory().then((Directory directory) async {
      File jsonFile = File(directory.path + "/marketData.json");
      jsonFile.writeAsStringSync(json.encode(marketListData.marketListData));
    });
    print("Got new market data.");
    marketListData.lastUpdate = DateTime.now().millisecondsSinceEpoch;
    return marketListData;
  }
}
