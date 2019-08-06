import 'package:cryptotracker/models/crypto.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'view.dart';

class DetailTopComponent extends Component<Crypto> {
  DetailTopComponent() : super(view: buildView, effect: buildEffect());
}
