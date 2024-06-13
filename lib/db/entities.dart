import 'package:json_annotation/json_annotation.dart';

part 'entities.g.dart';

@JsonSerializable()
class ChatMessage {
  final String title;
  final DateTime creationTime;
  final ChatRole role;

  ChatMessage({
    required this.title,
    required this.creationTime,
    required this.role,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}

enum ChatRole { user, socket }

@JsonSerializable()
class ChatRoom {
  final String id;
  final List<ChatMessage> messages;

  ChatRoom({
    required this.id,
    required this.messages,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);
}

@JsonSerializable()
class User {
  final String email;
  final List<ChatRoom> chatRooms;

  User({
    required this.email,
    required this.chatRooms,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
