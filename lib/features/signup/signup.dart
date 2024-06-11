// lib/main.dart

import 'package:flutter/material.dart';
import '../../services/websocket.dart';

class SignupScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SignupScreen> {
  final WebSocketManager _webSocketManager = WebSocketManager();
  String _message = "No message yet";
  int val=0;
  @override
  void initState() {
    super.initState();

    // Set up the callback to receive messages from WebSocket
    _webSocketManager.setWebSocketCallback((message) {
      print(message);
      setState(() {
        _message = message;
      });
    });

    // Start the WebSocket connection
    _webSocketManager.startWebSocket();
  }

  @override
  void dispose() {
    _webSocketManager.closeWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter WebSocket Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'WebSocket message:',
              ),
              Text(
                _message
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _webSocketManager.sendWebSocketMessage("Hello Shashank${val}");
                  val++;
                },
                child: const Text("Send Message"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
