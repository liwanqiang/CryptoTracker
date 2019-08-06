import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/home_page/adapter.dart';
import 'package:cryptotracker/views/pages/home_page/effect.dart';
import 'package:cryptotracker/views/pages/home_page/reducer.dart';
import 'package:cryptotracker/views/pages/home_page/state.dart';
import 'package:cryptotracker/views/pages/home_page/view.dart';

/// 在page中把view，reducer，view涵盖进来
class HomePage extends Page<HomePageState, Map<String, dynamic>> {
  HomePage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<HomePageState>(
              adapter: NoneConn<HomePageState>() + MovieGroupAdapter(),
              slots: <String, Dependent<HomePageState>>{}),
        );
}
