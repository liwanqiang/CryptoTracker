import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/crypto.dart';
import 'package:cryptotracker/models/stock.dart';

import 'effect.dart';
import 'view.dart';

class CryptoItemComponent extends Component<List<Crypto>> {
  CryptoItemComponent() : super(view: buildView, effect: buildEffect());
}
