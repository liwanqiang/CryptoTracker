import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/home_page/section_grid_component/action.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    VideoSectionAction.onSelect: onSelect,
  });
}

void onSelect(Action action, Context ctx) async {
  String videoId = action.payload;
  print(videoId);
}
