import 'package:fish_redux/fish_redux.dart';

enum CryptoDetailAction { didLoad, onFetch }

class CryptoDetailActionCreator {
  static Action didLoadAction(List history) {
    return Action(CryptoDetailAction.didLoad, payload: history);
  }

  static Action onFetchAction() {
    return Action(CryptoDetailAction.onFetch);
  }
}
