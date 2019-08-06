import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/global_store/action.dart';
import 'package:cryptotracker/views/pages/global_store/store.dart';
import 'package:cryptotracker/views/pages/home_page/action.dart';
import 'package:cryptotracker/views/pages/home_page/state.dart';
import 'package:cryptotracker/repository/apis.dart';

Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    Lifecycle.initState: _init,
    HomePageAction.onFetch: _onFetch,
    HomePageAction.onChangeTheme: _onChangeTheme,
  });
}

void _init(Action action, Context<HomePageState> ctx) async {
  Apis.getMovieHome().then((home) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(home));
  });
}

void _onFetch(Action action, Context<HomePageState> ctx) async {
  Apis.getMovieHome().then((home) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(home));
  });
}

void _onChangeTheme(Action action, Context<HomePageState> ctx) {
  //change pages.global data
  GlobalStore.store.dispatch(GlobalActionCreator.onchangeThemeColor());
}
