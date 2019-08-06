import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/home.dart';

/// action表示意图、动作的意思
enum HomePageAction {
  onLoad,
  onFetch,
  didLoad,
  onShowTV,
  onShowLibrary,
  onShowVideo,
  onShowSearch,
  onChangeTheme
}

class HomePageActionCreator {
  static Action onLoadAction(bool isLoading) {
    return Action(HomePageAction.onLoad, payload: isLoading);
  }

  static Action onFetchAction() {
    return Action(HomePageAction.onFetch);
  }

  static Action didLoadAction(Home home) {
    return Action(HomePageAction.didLoad, payload: home);
  }

  static Action onShowTV() {
    return Action(HomePageAction.onShowTV);
  }

  static Action onChangeTheme() {
    return const Action(HomePageAction.onChangeTheme);
  }

  /// 多参数的使用例子
  static Action updateAction(String title, String content) {
    println('action:update');
    return Action(
      HomePageAction.onShowSearch,
      payload: <String, String>{'title': title, 'content': content},
    );
  }
}
