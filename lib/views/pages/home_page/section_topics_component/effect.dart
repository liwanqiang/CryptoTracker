import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/home_page/section_topics_component/action.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    SectionTopicsAction.onSelect: onSelect,
  });
}

onSelect(Action action, Context ctx) {
  print(action.payload);
}
