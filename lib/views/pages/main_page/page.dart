import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/main_page/effect.dart';
import 'package:cryptotracker/views/pages/main_page/reducer.dart';
import 'package:cryptotracker/views/pages/main_page/state.dart';
import 'package:cryptotracker/views/pages/main_page/view.dart';

class MainPage extends Page<MainPageState, Map<String, dynamic>> {
  MainPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MainPageState>(
              adapter: null, slots: <String, Dependent<MainPageState>>{}),
          middleware: <Middleware<MainPageState>>[],
        );
}
