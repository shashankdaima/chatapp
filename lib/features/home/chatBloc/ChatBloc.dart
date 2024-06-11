import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/constants.dart';
// import '../../../services/wsService.dart';
import '../home.dart';

part 'ChatEvent.dart';
part 'ChatState.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // final WebSocketService wsService = WebSocketService(wsURL);

  ChatBloc(String chatRoomId)
      : super(ChatState(
            chatRoomId: chatRoomId, chats: getPreviousChats(chatRoomId))) {
    on<ChatMessageAddedBySystem>((event, emit) {
      // wsService.sendMessage(event.message);
      emit(ChatState(chatRoomId: state.chatRoomId, chats: [
        ...state.chats,
        ChatMessage(
            title: event.message,
            creationTime: DateTime.now(),
            role: ChatRole.user)
      ]));
    });
  }
}

getPreviousChats(String chatRoomId) {
  return hardcodedChats;
}
