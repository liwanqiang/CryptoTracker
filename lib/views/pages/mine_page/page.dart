import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/mine_page/state.dart';
import 'package:cryptotracker/views/pages/mine_page/view.dart';
import 'package:cryptotracker/views/pages/mine_page/effect.dart';
import 'package:cryptotracker/views/pages/mine_page/reducer.dart';

class MinePage extends Page<MinePageState, Map<String, dynamic>> {
  MinePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MinePageState>(
              adapter: null, slots: <String, Dependent<MinePageState>>{}),
          middleware: <Middleware<MinePageState>>[],
        );
}
