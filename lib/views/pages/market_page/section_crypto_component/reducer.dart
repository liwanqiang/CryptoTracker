import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Reducer<MarketPageState> buildReducer() => asReducer(
    <Object, Reducer<MarketPageState>>{CryptoItemAction.remove: _remove});

MarketPageState _remove(MarketPageState state, Action action) {
  final String unique = action.payload;
  return state.clone()
    ..currencyListData
        .marketListData
        .removeWhere((state) => state.symbol == unique);
}
