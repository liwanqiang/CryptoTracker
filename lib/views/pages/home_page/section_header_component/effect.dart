import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/home_page/section_header_component/action.dart';

Effect buildEffect() {
  return combineEffects(
      <Object, Effect>{SectionHeaderAction.onShowMore: onShowMore});
}

onShowMore(Action action, Context ctx) {
  String type = action.payload;
  print(type);
}
