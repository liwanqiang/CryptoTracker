import 'package:fish_redux/fish_redux.dart';

import 'views/pages/global_store/state.dart';
import 'views/pages/global_store/store.dart';
import 'views/pages/home_page/page.dart';
import 'views/pages/main_page/page.dart';
import 'views/pages/market_page/page.dart';
import 'views/pages/mine_page/page.dart';
import 'views/pages/setting_page/page.dart';

class AppRoute {
  static AbstractRoutes _global;
  static AbstractRoutes get global {
    if (_global == null) {
      _global = PageRoutes(
        /// 通过AbstractRoutes.buildPage（String key, dynamic arguments）
        /// 来生成页面对应的Widget。而页面传参就是通过第二个参数来传递的。
        pages: <String, Page<Object, dynamic>>{
          RoutePath.main: MainPage(),
          RoutePath.market: MarketPage(),
          RoutePath.setting: SettingPage(),
          RoutePath.mine: MinePage(),
          RoutePath.home: HomePage(),
        },
        visitor: (String path, Page<Object, dynamic> page) {
          /// 只有特定的范围的Page才需要建立和AppStore的连接关系
          /// 满足Page<T> T 是GlobalBaseState的之类
          if (page.isTypeof<GlobalBaseState>()) {
            /// 建立AppStore驱动PageStore的单项数据连接
            /// 1. 参数1 AppStore
            /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
            page.connectExtraStore<GlobalState>(GlobalStore.store,
                (Object pageState, GlobalState appState) {
              final GlobalBaseState _pageState = pageState;
              if (_pageState.themeBlack != appState.themeBlack &&
                  pageState is Cloneable) {
                final Object copy = pageState.clone();
                final GlobalBaseState newState = copy;
                newState.themeBlack = appState.themeBlack;
                return newState;
              }
              if (_pageState.currencyListData != appState.currencyListData &&
                  pageState is Cloneable) {
                final Object copy = pageState.clone();
                final GlobalBaseState newState = copy;
                newState.currencyListData = appState.currencyListData;
                return newState;
              }
              return pageState;
            });
          }

          page.enhancer.append(
            viewMiddleware: <ViewMiddleware<dynamic>>[
              /// View AOP
              safetyView<dynamic>(),
            ],

            /// Adapter AOP
            adapterMiddleware: <AdapterMiddleware<dynamic>>[
              safetyAdapter<dynamic>()
            ],

            /// Effect AOP
            effectMiddleware: [
              _pageAnalyticsMiddleware<dynamic>(),
            ],

            /// Store AOP
            middleware: <Middleware<dynamic>>[
              logMiddleware<dynamic>(tag: page.runtimeType.toString()),
            ],
          );
        },
      );
    }
    return _global;
  }

  /// 简单的Effect AOP
  /// 只针对页面的生命周期进行打印
  static EffectMiddleware<T> _pageAnalyticsMiddleware<T>(
      {String tag = 'redux'}) {
    return (AbstractLogic<dynamic> logic, Store<T> store) {
      return (Effect<dynamic> effect) {
        return (Action action, Context<dynamic> ctx) {
          if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
            print('${logic.runtimeType} ${action.type.toString()} ');
          }
          return effect?.call(action, ctx);
        };
      };
    };
  }
}

class RoutePath {
  static const String main = 'main';
  static const String home = 'home';
  static const String market = 'market';
  static const String setting = 'setting';
  static const String mine = 'mine';
  static const String stock = 'stock';
}
