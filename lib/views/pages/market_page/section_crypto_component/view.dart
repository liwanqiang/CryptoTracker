import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/models/stock.dart';
import 'package:cryptotracker/others/utils/computeutil.dart';

import 'action.dart';

Widget buildView(List<Crypto> cryptoData, dispatch, ViewService viewService) {
  return Column(children: <Widget>[
    topWidget(),
    ListView.builder(
      itemCount: cryptoData.length,
      itemBuilder: (BuildContext context, int position) {
        final stock = cryptoData[position];
        return getListViewItem(stock, dispatch);
      },
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
    ),
  ]);
}

Widget topWidget() {
  return Container(
    height: 30.0,
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                "股票名称",
                style: TextStyle(fontSize: 14.0),
              ),
              alignment: FractionalOffset.center,
            ),
            flex: 8,
          ),
          Expanded(
            child: Container(
              child: Text(
                "最新价",
                style: TextStyle(fontSize: 14.0),
              ),
              alignment: FractionalOffset.center,
            ),
            flex: 13,
          ),
          Expanded(
            child: Container(
              child: Text(
                "涨跌幅",
                style: TextStyle(fontSize: 14.0),
              ),
              alignment: FractionalOffset.center,
            ),
            flex: 9,
          ),
        ],
      ),
    ),
  );
}

Widget getListViewItem(Crypto currency, Dispatch dispatch) {
  return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //纵向对齐方式：起始边对齐
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Image.asset(
                            "assets/images/" +
                                currency.symbol.toLowerCase() +
                                ".png",
                            height: 28.0),
                        alignment: FractionalOffset.topCenter,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          currency.symbol,
                          style: TextStyle(fontSize: 12.0),
                        ),
                        alignment: FractionalOffset.bottomCenter,
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    currency.quotes.price.toStringAsFixed(2),
                    style: TextStyle(fontSize: 18.0),
                  ),
                  alignment: FractionalOffset.center,
                ),
                flex: 2,
              ),
              Expanded(
                child: showGains(currency.quotes.percentChange24h),
                flex: 1,
              )
            ],
          ),
        ),
      ),
      onLongPress: () {
        //dispatch(StockActionCreator.onRemove(stock.stock_code));
      },
      onTap: () {
        dispatch(CryptoItemActionCreator.onSelect(currency, Colors.red));
      });
}

showGains(double gains) {
  Color showColor;
  String gainsString = gains.toStringAsFixed(2) + "%";
  if (gains > 0) {
    showColor = Colors.red;
    gainsString = "+" + gainsString;
  } else if (gains < 0) {
    showColor = Colors.green;
  } else {
    showColor = Colors.black38;
  }
  return Container(
    color: showColor,
    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
    child: Text(
      gainsString,
      style: TextStyle(fontSize: 14.0, color: Colors.white),
    ),
    alignment: FractionalOffset.center,
  );
}
