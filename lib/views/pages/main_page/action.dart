import 'package:fish_redux/fish_redux.dart';

enum MainAction { switchTheme, switchIndex, changeTitle }

class MainActionCreator {
  static Action onAction(String action) {
    return Action(MainAction.switchTheme, payload: action);
  }

  static Action switchIndex(int index) {
    return Action(MainAction.switchIndex, payload: index);
  }

  static Action changeTitle(String title) {
    return Action(MainAction.changeTitle, payload: title);
  }
}
