import 'package:cryptotracker/views/pages/market_page/section_crypto_component/reducer.dart';
import 'package:fish_redux/fish_redux.dart';
import 'section_crypto_component/component.dart';
import 'state.dart';

class StockListAdapter extends DynamicFlowAdapter<MarketPageState> {
  StockListAdapter()
      : super(
          connector: StocksListConnector(),
          reducer: buildReducer(),
          pool: <String, Component<Object>>{
            "topic": CryptoItemComponent(),
          },
        );
}

class StocksListConnector extends ConnOp<MarketPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(MarketPageState state) {
    List<ItemBean> items = [];
    if (!state.isDataReady) {
      ///数据还没有准备好
      return items;
    }
    items.add(ItemBean('topic', state.currencyListData.marketListData));
    return items;
  }
}
