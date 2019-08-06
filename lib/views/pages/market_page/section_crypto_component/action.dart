import 'dart:ui';

import 'package:cryptotracker/models/crypto.dart';
import 'package:fish_redux/fish_redux.dart';

enum CryptoItemAction { onSelect, onRemove, remove }

class CryptoItemActionCreator {
  static Action onSelect(Crypto crypto, Color themeColor) {
    Map<String, dynamic> payload = {"symbol": crypto, 'themeColor': themeColor};
    return Action(CryptoItemAction.onSelect, payload: payload);
  }

  static Action onRemove(String uniqueId) =>
      Action(CryptoItemAction.onRemove, payload: uniqueId);

  static Action remove(String uniqueId) =>
      Action(CryptoItemAction.remove, payload: uniqueId);
}
