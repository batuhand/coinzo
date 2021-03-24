import 'package:coinzo_ticker/Models/pair_lists.dart';
import 'package:flutter/material.dart';

import 'Widgets/coin_card.dart';

class TryPage extends StatefulWidget {
  @override
  _TryPageState createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: ListView.builder(
          itemCount: try_pair_list.length,
          itemBuilder: (BuildContext context, int index) {
            return CoinCard(try_pair_list[index]);
          }),
    );
  }
}
