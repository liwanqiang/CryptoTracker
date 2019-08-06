import 'package:easy_localization/easy_localization.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/views/pages/home_page/action.dart';
import 'package:cryptotracker/views/pages/home_page/state.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

/// 提供实现界面的方法
Widget buildView(
    HomePageState state, dynamic dispatch, ViewService viewService) {
  final ListAdapter listAdapter = viewService.buildAdapter();
  var data = EasyLocalizationProvider.of(viewService.context).data;
  return EasyLocalizationProvider(
    data: data,
    child: Scaffold(
      key: state.scaffoldKey,
      body: ModalProgressHUD(
        dismissible: true,
        color: Colors.transparent,
        opacity: 1,
        inAsyncCall: state.isLoading,
        child: RefreshIndicator(
          onRefresh: () {
            return Future<void>.value(
                dispatch(HomePageActionCreator.onFetchAction()));
          },
          child: ListView.builder(
              itemBuilder: listAdapter.itemBuilder,
              itemCount: listAdapter.itemCount),
        ),
      ),
    ),
  );
}
