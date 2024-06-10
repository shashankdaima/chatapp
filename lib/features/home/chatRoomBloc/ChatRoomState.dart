part of 'ChatRoomBloc.dart';

class ChatRoomState extends Equatable {
  ChatRoomState({required this.roomIds, String? currentRoomId}) {
    if (currentRoomId == null) {
      this.currentRoomId = roomIds[0];
      return;
    }
    this.currentRoomId = currentRoomId;
  }
  final List<String> roomIds;
  late String currentRoomId;

  @override
  List<Object> get props => [roomIds, currentRoomId];
}

final class ChatRoomInitial extends ChatRoomState {
  ChatRoomInitial() : super(roomIds: ["Default Room Id"]);
}
