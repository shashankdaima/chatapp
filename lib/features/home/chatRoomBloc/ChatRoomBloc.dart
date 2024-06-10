import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ChatRoomEvents.dart';
part 'ChatRoomState.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc() : super(ChatRoomInitial()) {
    on<AddChatRoomEvent>((event, emit) {
      emit(ChatRoomState(
        roomIds: [event.chatRoomId, ...state.roomIds],
        currentRoomId: event.chatRoomId,
      ));
    });
    on<SelectChatRoom>((event, emit) {
      emit(ChatRoomState(
        roomIds: state.roomIds,
        currentRoomId: event.chatRoomId,
      ));
    });
  }
}
