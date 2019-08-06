import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/setting_page/state.dart';
import 'package:cryptotracker/views/pages/setting_page/view.dart';
import 'package:cryptotracker/views/pages/setting_page/effect.dart';
import 'package:cryptotracker/views/pages/setting_page/reducer.dart';

class SettingPage extends Page<SettingPageState, Map<String, dynamic>> {
  SettingPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<SettingPageState>(
              adapter: null, slots: <String, Dependent<SettingPageState>>{}),
          middleware: <Middleware<SettingPageState>>[],
        );
}
