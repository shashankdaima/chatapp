// lib/web_socket.dart

import 'dart:html' as html;
import 'dart:js' as js;

class WebSocketManager {
  void startWebSocket() {
    js.context.callMethod('startWebSocket');
  }

  void sendWebSocketMessage(String message) {
    js.context.callMethod('sendWebSocketMessage', [message]);
  }

  void closeWebSocket() {
    js.context.callMethod('closeWebSocket');
  }

  void setWebSocketCallback(Function(String) callback) {
    js.context['webSocketCallback'] = js.allowInterop((message) {
      callback(message);
    });
  }
}
