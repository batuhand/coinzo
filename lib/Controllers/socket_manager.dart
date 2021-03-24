import 'package:web_socket_channel/io.dart';

class SocketManager{
  final socketURL = "wss://www.coinzo.com/ws";

  IOWebSocketChannel getSocket(){
    return IOWebSocketChannel.connect(socketURL);
  }

  String completeJson(String message){
    var result = "{\"result\": " + message + "}";
    return result;
  }
}