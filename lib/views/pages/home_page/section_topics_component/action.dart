import 'package:fish_redux/fish_redux.dart';
import 'package:cryptotracker/models/home.dart';

enum SectionTopicsAction { onSelect }

class SectionTopicsActionCreator {
  static Action onSelect(Topic topic) {
    Map<String, dynamic> payload = {"topic": topic};
    return Action(SectionTopicsAction.onSelect, payload: payload);
  }
}
