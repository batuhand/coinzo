import 'package:coinzo_ticker/Models/pair_lists.dart';
import 'package:flutter/material.dart';

import '../statics.dart';
import 'Widgets/coin_card.dart';

class EthPage extends StatefulWidget {
  @override
  _EthPageState createState() => _EthPageState();
}

class _EthPageState extends State<EthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView.builder(
          itemCount: eth_pair_list.length,
          itemBuilder: (BuildContext context, int index) {
            return CoinCard(eth_pair_list[index]);
          }),
    );
  }
}
