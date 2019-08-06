import 'package:fish_redux/fish_redux.dart';

import 'section_kline_component/component.dart';
import 'section_top_component/component.dart';
import 'state.dart';

class CryptoDetailAdapter extends DynamicFlowAdapter<CryptoDetailState> {
  CryptoDetailAdapter()
      : super(
          connector: CryptoDetailConnector(),
          pool: <String, Component<Object>>{
            "header": DetailTopComponent(),
            "kline": KLineComponent(),
          },
        );
}

class CryptoDetailConnector extends ConnOp<CryptoDetailState, List<ItemBean>> {
  @override
  List<ItemBean> get(CryptoDetailState state) {
    List<ItemBean> items = [];
    if (state.crypto == null || state.history == null) {
      return items;
    }

    items.add(ItemBean('header', state.crypto));
    items.add(ItemBean('kline', state.history));
    return items;
  }
}
