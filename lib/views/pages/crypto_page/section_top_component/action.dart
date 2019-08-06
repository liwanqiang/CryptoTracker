import 'package:fish_redux/fish_redux.dart';

enum DetailTopAction { action }

class DetailTopActionCreator {
  static Action onAction() {
    return const Action(DetailTopAction.action);
  }
}
