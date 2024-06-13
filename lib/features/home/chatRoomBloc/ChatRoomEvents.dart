part of 'ChatRoomBloc.dart';

sealed class ChatRoomEvent extends Equatable {}

final class AddChatRoomEvent extends ChatRoomEvent {
  final String chatRoomId;

  AddChatRoomEvent({required this.chatRoomId});
  @override
  List<Object?> get props => [chatRoomId];
}

final class SelectChatRoom extends ChatRoomEvent {
  final String chatRoomId;

  SelectChatRoom({required this.chatRoomId});
  @override
  List<Object?> get props => [chatRoomId];
}

final class GetAllChatRooms extends ChatRoomEvent {
 
  @override
  List<Object?> get props => [];
}

final class DeleteChatRoomEvent extends ChatRoomEvent {
  final String chatRoomId;

  DeleteChatRoomEvent({required this.chatRoomId});
  @override
  List<Object?> get props => [chatRoomId];
}
