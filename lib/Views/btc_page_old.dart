// import 'dart:convert';
// import 'dart:io';
//
// import 'package:coinzo_ticker/Controllers/socket_manager.dart';
// import 'package:coinzo_ticker/Models/CoinModel.dart';
// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/io.dart';
//
// class BtcPage extends StatefulWidget {
//   @override
//   _BtcPageState createState() => _BtcPageState();
// }
//
// class _BtcPageState extends State<BtcPage> {
//   SocketManager socketManager = new SocketManager();
//   WebSocketChannel channel;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//   channel = socketManager.getSocket();
//   channel.sink.add( '{"event":"subscribe","channel":"ticker","pair":"XRP-BTC"}' );
//
//   super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     channel.sink.close();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:   StreamBuilder(
//         stream: channel.stream,
//         builder: (context, snapshot) {
//           var str = snapshot.data;
//           var model = jsonDecode(socketManager.completeJson(str));
//           print(snapshot.data);
//           print(model["result"][1][0]);
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 24.0),
//             child: Text(snapshot.hasData ? '${model["result"][1][2]}' : 'Yok'),
//           );
//         },
//       ),
//     );
//   }
// }
