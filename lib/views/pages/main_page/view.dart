import 'package:cryptotracker/others/const.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:cryptotracker/routes.dart';
import 'package:cryptotracker/views/pages/global_store/action.dart';
import 'package:cryptotracker/views/pages/global_store/store.dart';
import 'package:cryptotracker/views/pages/main_page/action.dart';
import 'package:cryptotracker/views/pages/main_page/state.dart';

Widget buildView(
    MainPageState state, Dispatch dispatch, ViewService viewService) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: state.themeBlack ? Constants.darkTheme : Constants.lightTheme,
//    theme: ThemeData(
//      primarySwatch: state.themeColor,
//    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text(state.title),
        actions: <Widget>[
          GestureDetector(
              child: Icon(
                Icons.colorize,
                size: 18,
                color: Colors.grey,
              ),
              onTap: () {
                //Navigator.pushNamed(viewService.context, 'setting');
                //dispatch(AppBarActionCreator.onSetting());
                GlobalStore.store
                    .dispatch(GlobalActionCreator.onchangeThemeColor());
              }),
        ],
      ),
      body: IndexedStack(
        children: <Widget>[
          AppRoute.global.buildPage(RoutePath.home, null),
          AppRoute.global.buildPage(RoutePath.market, null),
          AppRoute.global.buildPage(RoutePath.mine, null),
          AppRoute.global.buildPage(RoutePath.setting, null),
        ],
        index: state.index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.score), title: Text("市场")),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny), title: Text("我的")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("设置")),
        ],
        fixedColor: Colors.blue,
        currentIndex: state.index,
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.white,
        onTap: (int index) {
          dispatch(MainActionCreator.switchIndex(index));
        },
      ),
    ),
  );
}
