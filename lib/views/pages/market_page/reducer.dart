import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

/// 约定effect接收的action.type以on开头，reducer的以非on开头。
Reducer<MarketPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<MarketPageState>>{
      Lifecycle.initState: _init,
      MarketPageAction.didLoad: _didLoad,
      MarketPageAction.onFetch: _fetchData,
    },
  );
}

MarketPageState _init(MarketPageState state, Action action) {
  MarketPageState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

MarketPageState _fetchData(MarketPageState state, Action action) {
  MarketPageState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

MarketPageState _didLoad(MarketPageState state, Action action) {
  final MarketPageState newState = state.clone();
  //Market market = action.payload;
  //newState.market = market;
  newState.isLoading = false;
  return newState;
}
