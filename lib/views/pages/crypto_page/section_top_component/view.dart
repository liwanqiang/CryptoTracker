import 'package:cryptotracker/models/crypto.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Crypto state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
    height: 50.0,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: showPrices(state),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "今    开",
                        style: TextStyle(fontSize: 12.0, color: Colors.black38),
                        textAlign: TextAlign.left,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            state.quotes.price.toStringAsFixed(2),
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                          ),
                          alignment: FractionalOffset.centerRight,
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "成交量",
                        style: TextStyle(fontSize: 12.0, color: Colors.black38),
                        textAlign: TextAlign.left,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            (state.circulatingSupply / 1000000)
                                    .toStringAsFixed(2) +
                                "万手",
                            maxLines: 1,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                          ),
                          alignment: FractionalOffset.centerRight,
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(
                      "昨    收",
                      style: TextStyle(fontSize: 12.0, color: Colors.black38),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          state.quotes.percentChange24h.toStringAsFixed(2),
                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                        ),
                        alignment: FractionalOffset.centerRight,
                      ),
                      flex: 1,
                    )
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(
                      "成交额",
                      style: TextStyle(fontSize: 12.0, color: Colors.black38),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          (state.maxSupply / 10000).toString() + "万",
                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                          maxLines: 1,
                        ),
                        alignment: FractionalOffset.centerRight,
                      ),
                      flex: 1,
                    )
                  ],
                ),
                flex: 1,
              )
            ]),
          ),
          flex: 1,
        ),
      ],
    ),
  );
}

/**
 * 主要价格信息
 */
showPrices(Crypto crypto) {
  return Container(
    padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
    child: Column(
      children: <Widget>[
        Container(
          child: Text(
            crypto.quotes.price.toStringAsFixed(2),
            style: TextStyle(fontSize: 20.0, color: Colors.red),
          ),
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
          alignment: FractionalOffset.topLeft,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  crypto.quotes.percentChange24h.toString(),
                  style: TextStyle(fontSize: 12.0, color: Colors.red),
                  textAlign: TextAlign.left,
                ),
                alignment: FractionalOffset.bottomLeft,
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                child: Text(
                  crypto.quotes.percentChange24h.toString(),
                  style: TextStyle(fontSize: 12.0, color: Colors.red),
                  textAlign: TextAlign.left,
                ),
                alignment: FractionalOffset.bottomLeft,
              ),
              flex: 1,
            )
          ],
        )
      ],
    ),
  );
}
