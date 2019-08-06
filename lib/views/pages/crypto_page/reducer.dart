import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<CryptoDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<CryptoDetailState>>{
      CryptoDetailAction.didLoad: _didLoad,
    },
  );
}

CryptoDetailState _didLoad(CryptoDetailState state, Action action) {
  final CryptoDetailState newState = state.clone();
  List history = action.payload;
  newState.history = history;
  newState.isLoading = false;
  return newState;
}
