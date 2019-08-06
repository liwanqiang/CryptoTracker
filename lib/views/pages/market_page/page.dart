import 'package:fish_redux/fish_redux.dart';

import 'adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

///Page<T, P> T指状态的数据类型，P指页面的入参类型。
/// Dependent = Connnector + Component。因为子组件的状态与当前组件的状态，类型不一致，需要使用connector来转换沟通。
class MarketPage extends Page<MarketPageState, Map<String, dynamic>> {
  MarketPage()
      : super(
          ///initState的作用是将打开页面时传入的参数类型为P的值对应到状态T中，控制页面初始的显示内容。
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,

          ///dependencies 它的作用是给当前组件提供其他组件或者Adapter。
          /// slots的作用是给ViewBuilder提供子组件，
          /// 在ViewBuilder中通过ViewService.buildComponent(key)来使用，key值就是Map的key。

          dependencies: Dependencies<MarketPageState>(
              adapter: NoneConn<MarketPageState>() + StockListAdapter(),
              slots: <String, Dependent<MarketPageState>>{}),
          middleware: <Middleware<MarketPageState>>[],
        );
}
