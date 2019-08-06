import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'view.dart';

class KLineComponent extends Component<List> {
  KLineComponent() : super(view: buildView, effect: buildEffect());
}
