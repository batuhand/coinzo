import 'dart:convert';

import 'package:coinzo_ticker/Controllers/socket_manager.dart';
import 'package:coinzo_ticker/Views/Widgets/usd_price.dart';
import 'package:coinzo_ticker/statics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CoinCard extends StatefulWidget {
  final String pair;

  const CoinCard(this.pair);
  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  SocketManager socketManager = new SocketManager();
  WebSocketChannel channel;
  @override
  void initState() {
    var str = widget.pair;
    channel = socketManager.getSocket();
    channel.sink.add('{"event":"subscribe","channel":"ticker","pair":"$str"}');
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var coin = widget.pair.split("-")[0];
    var fiat = widget.pair.split("-")[1];

    return Container(
      color: backgroundColor,
      height: 70,
      child: Card(
        color: backgroundColor,
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 22,
                  width: MediaQuery.of(context).size.width / 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 26,
                  width: MediaQuery.of(context).size.width / 12,
                  child: Image.network(
                    "https://www.coinzo.com/static/coins/" +
                        coin.toLowerCase() +
                        ".png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 22,
                  width: MediaQuery.of(context).size.width / 50,
                ),
                Text(coin,style: TextStyle(color: textColor1,fontWeight: FontWeight.bold),),
              ],
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var str = snapshot.data;
                  Color percColor;
                  var model = jsonDecode(socketManager.completeJson(str));
                  if(model["result"][1][1][0]=="-"){
                    percColor = negativeColor;
                  }else{
                    percColor = positiveColor;
                  }
                  return Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            children: [
                              Text(
                                snapshot.hasData
                                    ? '${model["result"][1][2]} ' + fiat
                                    : '',
                                textAlign: TextAlign.end,style: TextStyle(color: textColor1,fontWeight: FontWeight.bold)
                              ),
                              UsdPrice(coin),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 22,
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Text(snapshot.hasData
                              ? '%${model["result"][1][1]}'
                              : '', textAlign: TextAlign.end,style: TextStyle(color: percColor, fontWeight: FontWeight.bold),)),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
