import 'package:bloc/bloc.dart';
import 'package:chatapp/db/db.dart';
import 'package:chatapp/db/entities.dart';
import 'package:equatable/equatable.dart';

part 'ChatRoomEvents.dart';
part 'ChatRoomState.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc(String email) : super(ChatRoomInitial(email)) {
    on<AddChatRoomEvent>((event, emit) async {
      await addNewChatRoom(state.email, event.chatRoomId);
      emit(ChatRoomState(
        email: state.email,
        roomIds: [...state.roomIds, event.chatRoomId],
        currentRoomId: event.chatRoomId,
      ));
    });
    on<SelectChatRoom>((event, emit) {
      emit(ChatRoomState(
        email: state.email,
        roomIds: state.roomIds,
        currentRoomId: event.chatRoomId,
      ));
    });
    on<GetAllChatRooms>((event, emit) async {
      // print(state.email);
      List<String>? chatRooms = await getAllChatRooms(state.email);
      if (chatRooms != null && chatRooms.isNotEmpty) {
        emit(ChatRoomState(
            email: state.email,
            roomIds: chatRooms,
            currentRoomId: chatRooms[0]));
      }
    });
    on<DeleteChatRoomEvent>((event, emit) async {
      final currentRooms = state.roomIds;
      currentRooms.removeWhere((roomId) => roomId == event.chatRoomId);
      // print(currentRooms);
      await removeChatRoom(state.email, event.chatRoomId);
      emit(ChatRoomState(
          email: state.email,
          currentRoomId: (state.currentRoomId != event.chatRoomId)
              ? state.currentRoomId
              : (currentRooms.isNotEmpty)
                  ? currentRooms[0]
                  : NO_CHAT_ROOM_SELECTED,
          roomIds: currentRooms));
    });

    //Getting previous chatrooms
    add(GetAllChatRooms());
  }
}

const NO_CHAT_ROOM_SELECTED = "\$NO_CHAT_ROOM_SELECTED\$";
