import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/stock.dart';

enum MarketPageAction { didLoad, onFetch }

class MarketPageActionCreator {
  static Action onFetchAction() {
    return Action(MarketPageAction.onFetch);
  }

  static Action didLoadAction() {
    return Action(MarketPageAction.didLoad);
  }
}
