import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/wsService.dart';
import '../home.dart';

part 'ChatEvent.dart';
part 'ChatState.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketService wsService = WebSocketService();

  ChatBloc(String chatRoomId)
      : super(ChatState(
            chatRoomId: chatRoomId, chats: getPreviousChats(chatRoomId))) {
    on<ChatMessageAddedByUser>((event, emit) {
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
  }
}

getPreviousChats(String chatRoomId) {
  return hardcodedChats;
}
