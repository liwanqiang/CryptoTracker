import 'package:cryptotracker/views/pages/crypto_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';

Effect buildEffect() {
  return combineEffects(<Object, Effect>{
    CryptoItemAction.onSelect: onSelect,
    CryptoItemAction.onRemove: _onRemove
  });
}

void onSelect(Action action, Context ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return CryptoPage().buildPage(action.payload);
  }));
}

void _onRemove(Action action, Context ctx) {
  _select(ctx, action).then((select) {
    if (select == 'YES') {
      ctx.dispatch(CryptoItemActionCreator.remove(action.payload));
    }
  });
}

Future<String> _select(Context ctx, Action action) async => showDialog<String>(
    context: ctx.context,
    builder: (buildContext) => AlertDialog(
          title: Text('你是否要删除 "${action.payload}" ？'),
          actions: <Widget>[
            GestureDetector(
              child: const Text(
                '取消',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () => Navigator.of(buildContext).pop(),
            ),
            GestureDetector(
              child: const Text(
                '确定',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () => Navigator.of(buildContext).pop('YES'),
            )
          ],
        ));
