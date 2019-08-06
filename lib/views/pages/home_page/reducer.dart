import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/home.dart';
import 'package:cryptotracker/views/pages/home_page/action.dart';
import 'package:cryptotracker/views/pages/home_page/state.dart';

/// reducer用于接收意图，该文件提供了Reducer，声明Reducer监听的action，实现监听到action的动作
Reducer<HomePageState> buildReducer() {
  return asReducer(<Object, Reducer<HomePageState>>{
    HomePageAction.onLoad: onLoad,
    HomePageAction.didLoad: loadMovies,
    Lifecycle.initState: _init,
  });
}

HomePageState _init(HomePageState state, Action action) {
  print('************************* home reducer _init =======================');
  HomePageState newState = state.clone();
  newState.isLoading = true;
  return newState;
}

HomePageState loadMovies(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  Home home = action.payload;
  newState.home = home;
  newState.isLoading = false;
  return newState;
}

HomePageState onLoad(HomePageState state, Action action) {
  HomePageState newState = state.clone();
  newState.isLoading = action.payload;
  return newState;
}
