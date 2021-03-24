import 'dart:convert';

import 'package:coinzo_ticker/Controllers/socket_manager.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../statics.dart';

class UsdPrice extends StatefulWidget {
  final String coin;

  const UsdPrice(this.coin);

  @override
  _UsdPriceState createState() => _UsdPriceState();
}

class _UsdPriceState extends State<UsdPrice> {
  SocketManager socketManager = new SocketManager();
  WebSocketChannel channel;
  @override
  void initState() {
    var str = widget.coin;
    channel = socketManager.getSocket();
    channel.sink
        .add('{"event":"subscribe","channel":"ticker","pair":"$str-TRY"}');
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var str = snapshot.data;
            var model = jsonDecode(socketManager.completeJson(str));
            var usd = double.parse(model["result"][1][2])/8;
            return Text(snapshot.hasData ? '~${usd} USD' : '',
                textAlign: TextAlign.end,
                style:
                    TextStyle(color: textColor2, fontWeight: FontWeight.bold));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
