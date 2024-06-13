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
        email:state.email,
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
    add(GetAllChatRooms());
  }
}
