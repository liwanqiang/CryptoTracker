import 'package:easy_localization/easy_localization.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'action.dart';
import 'state.dart';

/// state存储着当前的组件状态，dispatch用来发射事件，viewService用来绑定子组件或者adapter。
Widget buildView(
    MarketPageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  var data = EasyLocalizationProvider.of(viewService.context).data;
  print('market_page:view:buildview');
  return EasyLocalizationProvider(
    data: data,
    child: Scaffold(
      key: state.scaffoldKey,
      body: ModalProgressHUD(
        dismissible: true,
        color: Colors.transparent,
        opacity: 1.0,
        inAsyncCall: state.isLoading,
        child: RefreshIndicator(
          onRefresh: () {
            return Future<void>.value(
                // dispatch事件的处理流程依次是：effect -> middleware -> reducer。
                dispatch(MarketPageActionCreator.onFetchAction()));
          },
          child: ListView.builder(
              itemBuilder: listAdapter.itemBuilder,
              itemCount: listAdapter.itemCount),
        ),
      ),
    ),
  );
}
