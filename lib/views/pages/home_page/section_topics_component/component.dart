import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/home.dart';
import 'package:cryptotracker/views/pages/home_page/section_topics_component/view.dart';
import 'package:cryptotracker/views/pages/home_page/section_topics_component/effect.dart';

class TopicHorizontalComponent extends Component<List<Topic>> {
  TopicHorizontalComponent() : super(view: buildView, effect: buildEffect());
}
