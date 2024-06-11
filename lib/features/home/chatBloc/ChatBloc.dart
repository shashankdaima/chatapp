import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/constants.dart';
import '../../../services/websocket.dart';
import '../home.dart';

part 'ChatEvent.dart';
part 'ChatState.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // final WebSocketService wsService = WebSocketService(wsURL);
  WebSocketManager socketManager = WebSocketManager();
  ChatBloc(String chatRoomId)
      : super(ChatState(
            chatRoomId: chatRoomId, chats: getPreviousChats(chatRoomId))) {
    on<ChatMessageAddedByUser>((event, emit) {
      socketManager.sendWebSocketMessage(event.message);
      emit(ChatState(chatRoomId: state.chatRoomId, chats: [
        ...state.chats,
        ChatMessage(
            title: event.message,
            creationTime: DateTime.now(),
            role: ChatRole.user)
      ]));
    });
    on<ChatMessageAddedBySystem>((event, emit) {
      emit(ChatState(chatRoomId: state.chatRoomId, chats: [
        ...state.chats,
        ChatMessage(
            title: event.message,
            creationTime: DateTime.now(),
            role: ChatRole.socket)
      ]));
    });
    on<OpenWs>((event, emit) {
      socketManager.startWebSocket();
    });
    on<CloseWs>((event, emit) {
      socketManager.closeWebSocket();
    });

    // Listen for WebSocket messages
    socketManager.setWebSocketCallback((message) {
      add(ChatMessageAddedBySystem(message: message));
    });

    // Start the WebSocket connection when the bloc is created
    add(OpenWs());
  }
  @override
  Future<void> close() {
    add(CloseWs());
    return super.close();
  }
}

getPreviousChats(String chatRoomId) {
  return hardcodedChats;
}
