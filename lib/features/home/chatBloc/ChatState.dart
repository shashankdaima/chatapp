part of 'ChatBloc.dart';
class ChatState  extends Equatable{
  final String chatRoomId;
  final List<ChatMessage> chats;
  ChatState({required this.chatRoomId, required this.chats});
  
  @override
  // TODO: implement props
  List<Object?> get props => [chatRoomId, ...chats];
}

class ChatMessage {
  final String title;
  final DateTime creationTime;
  final ChatRole role;
  ChatMessage(
      {required this.title, required this.creationTime, required this.role});
}

enum ChatRole { user, socket }
