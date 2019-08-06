import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/home_page/section_grid_component/component.dart';
import 'package:cryptotracker/views/pages/home_page/section_header_component/component.dart';
import 'package:cryptotracker/views/pages/home_page/section_topics_component/component.dart';
import 'package:cryptotracker/views/pages/home_page/state.dart';

class MovieGroupAdapter extends DynamicFlowAdapter<HomePageState> {
  MovieGroupAdapter()
      : super(
          connector: HomeMovieListConnector(),
          pool: <String, Component<Object>>{
            "topic": TopicHorizontalComponent(),
            "header": SectionHeaderComponent(),
            "grid": SectionGridComponent(),
          },
        );
}

class HomeMovieListConnector extends ConnOp<HomePageState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomePageState state) {
    List<ItemBean> items = [];
    if (!state.isDataReady) {
      return items;
    }

    items.add(ItemBean('header', "精选主题"));
    items.add(ItemBean('topic', state.home.topics));
    for (var section in state.home.sections) {
      items.add(ItemBean('header', section.title));
      items.add(ItemBean('grid', section.items.take(9).toList()));
    }

    return items;
  }
}
