import 'package:cryptotracker/views/widgets/candle.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(List history, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 300,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: CandleGraph(
      data: history,
      enableGridLines: true,
      gridLineColor: Theme.of(viewService.context).dividerColor,
      gridLineLabelColor: Theme.of(viewService.context).hintColor,
      gridLineAmount: 4,
      volumeProp: 0.2,
    ),
  );
}
