import 'package:chatapp/db/db.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/constants.dart';
import '../../../services/websocket.dart';
import '../home.dart';
import "../../../db/entities.dart" as dbEntities;
part 'ChatEvent.dart';
part 'ChatState.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // final WebSocketService wsService = WebSocketService(wsURL);
  WebSocketManager socketManager = WebSocketManager();
  final String chatRoomId;
  final String email;

  ChatBloc(this.chatRoomId, this.email)
      : super(ChatState(chatRoomId: chatRoomId, chats: [])) {
    on<ChatMessageAddedByUser>((event, emit) {
      socketManager.sendWebSocketMessage(event.message);
      addChatMessage(
          dbEntities.ChatMessage(
              title: event.message,
              creationTime: DateTime.now(),
              role: dbEntities.ChatRole.user),
          chatRoomId,
          email);
      emit(ChatState(chatRoomId: state.chatRoomId, chats: [
        ...state.chats,
        ChatMessage(
            title: event.message,
            creationTime: DateTime.now(),
            role: ChatRole.user)
      ]));
    });
    on<ChatMessageAddedBySystem>((event, emit) {
      addChatMessage(
          dbEntities.ChatMessage(
              title: event.message,
              creationTime: DateTime.now(),
              role: dbEntities.ChatRole.socket),
          chatRoomId,
          email);
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

    on<LoadChats>((event, emit) => loadChat(emit));
    // Listen for WebSocket messages
    socketManager.setWebSocketCallback((message) {
      add(ChatMessageAddedBySystem(message: message));
    });
    add(LoadChats());
  }

  void loadChat(Emitter<ChatState> emit) async {
    List<dbEntities.ChatMessage> chats =
        await getChatRoomMessages(chatRoomId, email);
    final resultantChats = chats
        .map((chat) => ChatMessage(
            title: chat.title,
            creationTime: chat.creationTime,
            role: (chat.role == dbEntities.ChatRole.socket)
                ? ChatRole.socket
                : ChatRole.user))
        .toList();
    emit(ChatState(chatRoomId: state.chatRoomId, chats: resultantChats));
  }
}
// {"email":"daima.coder@gmail.com","chatRooms":[{"id":"Default Room","messages":[]}]}