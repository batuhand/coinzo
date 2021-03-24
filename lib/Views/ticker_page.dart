import 'package:coinzo_ticker/Views/btc_page_old.dart';
import 'package:coinzo_ticker/Views/eth_page.dart';
import 'package:coinzo_ticker/Views/try_page.dart';
import 'package:coinzo_ticker/statics.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import 'btc_page.dart';

class TickerPage extends StatefulWidget {
  @override
  _TickerPageState createState() => _TickerPageState();
}

class _TickerPageState extends State<TickerPage> {
  List<Widget> list = [
    Tab(text: "TRY"),
    Tab(text: "BTC"),
    Tab(text: "ETH"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: list.length,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "coinzo",
                  textAlign: TextAlign.start,
                )),
            backgroundColor: appBarColor,
            bottom: TabBar(tabs: list),
          ),
          body: TabBarView(
            children: [
              TryPage(),
              BtcPage(),
              EthPage(),
            ],
          ),
        ),
      ),
    );
  }
}
