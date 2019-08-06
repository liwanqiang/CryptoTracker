import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/views/pages/home_page/section_header_component/effect.dart';
import 'package:cryptotracker/views/pages/home_page/section_header_component/view.dart';

class SectionHeaderComponent extends Component<String> {
  SectionHeaderComponent() : super(view: buildView, effect: buildEffect());
}
