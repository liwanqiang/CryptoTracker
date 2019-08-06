import 'package:fish_redux/fish_redux.dart';

enum MinePageAction { action }

class MinePageActionCreator {
  static Action onAction() {
    return const Action(MinePageAction.action);
  }
}
