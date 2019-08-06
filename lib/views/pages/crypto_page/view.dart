import 'package:easy_localization/easy_localization.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cryptotracker/views/widgets/candle.dart';

import 'action.dart';
import 'state.dart';
//
//Widget buildView(StockState state, Dispatch dispatch, ViewService viewService) {
//  var data = EasyLocalizationProvider.of(viewService.context).data;
//  return EasyLocalizationProvider(
//    data: data,
//    child: Scaffold(
//      key: state.scaffoldKey,
//      body: ModalProgressHUD(
//        dismissible: true,
//        color: Colors.transparent,
//        opacity: 1,
//        inAsyncCall: state.isLoading,
//        child: RefreshIndicator(
//            onRefresh: () {
//              return Future<void>.value(
//                  // dispatch事件的处理流程依次是：effect -> middleware -> reducer。
//                  dispatch(StockActionCreator.onFetchAction()));
//            },
//            child: Container(
//              padding: EdgeInsets.only(left: 2.0, right: 1.0, top: 10.0),
//              child: CandleGraph(
//                data: state.history,
//                enableGridLines: true,
//                gridLineColor: Theme.of(viewService.context).dividerColor,
//                gridLineLabelColor: Theme.of(viewService.context).hintColor,
//                gridLineAmount: 4,
//                volumeProp: 0.2,
//              ),
//            )),
//      ),
//    ),
//  );
//}

/// 提供实现界面的方法
Widget buildView(
    CryptoDetailState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  print('state.themeColor = ${state.themeColor}');
  var data = EasyLocalizationProvider.of(viewService.context).data;
  return EasyLocalizationProvider(
    data: data,
    child: Scaffold(
      key: state.scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: state.themeColor,
        title: Row(
          //纵向对齐方式：起始边对齐
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Container(
              child: Image.asset(
                  "assets/images/" + state.crypto.symbol.toLowerCase() + ".png",
                  height: 28.0),
              //alignment: FractionalOffset.topCenter,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Text(
                state.crypto.symbol,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              //alignment: FractionalOffset.bottomCenter,
            )
          ],
        ),
      ),
      body: ModalProgressHUD(
        dismissible: true,
        color: Colors.transparent,
        opacity: 1,
        inAsyncCall: state.isLoading,
        child: ListView.builder(
            itemBuilder: listAdapter.itemBuilder,
            itemCount: listAdapter.itemCount),
      ),
    ),
  );
}
