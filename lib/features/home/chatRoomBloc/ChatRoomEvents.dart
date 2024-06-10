part of 'ChatRoomBloc.dart';

sealed class ChatRoomEvent extends Equatable {}

final class AddChatRoomEvent extends ChatRoomEvent{
  final String chatRoomId;

  AddChatRoomEvent({required this.chatRoomId});
  @override
  List<Object?> get props => [chatRoomId];

}

final class SelectChatRoom extends ChatRoomEvent{
  final String chatRoomId;

  SelectChatRoom({required this.chatRoomId});
  @override
  List<Object?> get props => [chatRoomId];
}