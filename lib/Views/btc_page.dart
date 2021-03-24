import 'package:coinzo_ticker/Models/pair_lists.dart';
import 'package:coinzo_ticker/Views/Widgets/coin_card.dart';
import 'package:coinzo_ticker/statics.dart';
import 'package:flutter/material.dart';

class BtcPage extends StatefulWidget {
  @override
  _BtcPageState createState() => _BtcPageState();
}

class _BtcPageState extends State<BtcPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView.builder(
          itemCount: btc_pair_list.length,
          itemBuilder: (BuildContext context, int index) {
            return CoinCard(btc_pair_list[index]);
          }),
    );
  }
}
