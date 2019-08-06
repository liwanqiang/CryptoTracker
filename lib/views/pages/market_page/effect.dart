import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/repository/apis.dart';
import 'package:cryptotracker/views/pages/global_store/action.dart';
import 'package:cryptotracker/views/pages/global_store/store.dart';
import 'action.dart';
import 'state.dart';

/// 它与reducer有点像，都是处理特定的action事件。区别有以下几点：
/// effect处理非修改数据的行为事件，reducer处理修改数据的行为事件。
/// effect返回bool或Future, reducer无返回值
Effect<MarketPageState> buildEffect() {
  return combineEffects(<Object, Effect<MarketPageState>>{
    Lifecycle.initState: _onInit,
    MarketPageAction.onFetch: _onFetch,
  });
}

void _onInit(Action action, Context<MarketPageState> ctx) async {
  print(
      '************************* market reducer _init =======================');
  const int fifteenMin = 15 * 60 * 1000;
  if (!ctx.state.isDataReady ||
      DateTime.now().millisecondsSinceEpoch -
              ctx.state.currencyListData.lastUpdate >=
          fifteenMin) {
    Apis.getEncryptedCurrencyMarket().then((currency) {
      ctx.dispatch(MarketPageActionCreator.didLoadAction());
      GlobalStore.store.dispatch(GlobalActionCreator.onUpdateData(currency));
    });
  } else {
    ctx.dispatch(MarketPageActionCreator.didLoadAction());
  }
}

void _onFetch(Action action, Context<MarketPageState> ctx) async {
  const int fifteenMin = 15 * 60 * 1000;
  if (DateTime.now().millisecondsSinceEpoch -
          ctx.state.currencyListData.lastUpdate >=
      fifteenMin) {
    Apis.getEncryptedCurrencyMarket().then((currency) {
      ctx.dispatch(MarketPageActionCreator.didLoadAction());
      GlobalStore.store.dispatch(GlobalActionCreator.onUpdateData(currency));
    });
  } else {
    ctx.dispatch(MarketPageActionCreator.didLoadAction());
  }
}
