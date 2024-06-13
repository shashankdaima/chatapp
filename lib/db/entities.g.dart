// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      title: json['title'] as String,
      creationTime: DateTime.parse(json['creationTime'] as String),
      role: $enumDecode(_$ChatRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'creationTime': instance.creationTime.toIso8601String(),
      'role': _$ChatRoleEnumMap[instance.role]!,
    };

const _$ChatRoleEnumMap = {
  ChatRole.user: 'user',
  ChatRole.socket: 'socket',
};

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => ChatRoom(
      id: json['id'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'id': instance.id,
      'messages': instance.messages,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      chatRooms: (json['chatRooms'] as List<dynamic>)
          .map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'chatRooms': instance.chatRooms,
    };
