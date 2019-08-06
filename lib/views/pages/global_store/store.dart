import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/global_store/reducer.dart';
import 'package:cryptotracker/views/pages/global_store/state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}
