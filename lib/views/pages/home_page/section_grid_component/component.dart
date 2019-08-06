import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/video.dart';
import 'package:cryptotracker/views/pages/home_page/section_grid_component/view.dart';
import 'package:cryptotracker/views/pages/home_page/section_grid_component/effect.dart';

class SectionGridComponent extends Component<List<Video>> {
  SectionGridComponent() : super(view: buildView, effect: buildEffect());
}
