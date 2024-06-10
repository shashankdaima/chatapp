import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  late WebSocketChannel _channel;
  final _controller = StreamController<String>();

  Stream<String> get messages => _controller.stream;

  void connect(String url) {
    final wsUrl = Uri.parse(url);
    _channel = WebSocketChannel.connect(wsUrl);

    _channel.stream.listen((message) {
      _controller.add(message);
    });
  }

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  void close() {
    _channel.sink.close(status.goingAway);
    _controller.close();
  }
}
