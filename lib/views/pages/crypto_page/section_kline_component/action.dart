import 'package:fish_redux/fish_redux.dart';

enum KLineAction { action }

class KLineActionCreator {
  static Action onAction() {
    return const Action(KLineAction.action);
  }
}
