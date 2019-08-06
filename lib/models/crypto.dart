/// 加密货币市场
class EnCurrencyMarket {
  List<Crypto> marketListData = [];
  int lastUpdate = 0;
}

/// 加密货币
class Crypto extends Object {
  var id; //序号
  var name; //名字
  var symbol; //简称
  var websiteSlug;
  var rank; // 排名
  var circulatingSupply;
  var totalSupply;
  var maxSupply;
  Quotes quotes; // 收盘价格
  var lastUpdated; // 上次更新

  Crypto.fromMap(dynamic json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    websiteSlug = json['website_slug'];
    rank = json['rank'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    quotes = Quotes.fromMap(json['quotes']['USD']);
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['website_slug'] = this.websiteSlug;
    data['rank'] = this.rank;
    data['circulating_supply'] = this.circulatingSupply;
    data['total_supply'] = this.totalSupply;
    data['max_supply'] = this.maxSupply;
    data['quotes'] = {'USD': this.quotes.toJson()};
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}

// 收盘价格和数据
class Quotes extends Object {
  var price;
  var volume24h;
  var marketCap;
  var percentChange1h;
  var percentChange24h;
  var percentChange7d;

  Quotes.fromMap(dynamic json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    marketCap = json['market_cap'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['price'] = this.price;
    data['volume_24h'] = this.volume24h;
    data['market_cap'] = this.marketCap;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_2h'] = this.percentChange1h;
    data['percent_change_7d'] = this.percentChange7d;
    return data;
  }
}
