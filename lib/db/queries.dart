part of "db.dart";

saveUser(String email, User user) async {
  // print(jsonEncode(user.toJson()));
  await StorageRepository.save(email, jsonEncode(user.toJson()));
}

Future<bool> checkWhetherUserExists(String email) async {
  return await StorageRepository.get(email) == null;
}

Future<List<String>?> getAllChatRooms(String email) async {
  String? result = await StorageRepository.get(email);
  if (result == null) {
    return null;
  }
  User user = User.fromJson(jsonDecode(result));
  return user.chatRooms.map((chatRoom) => chatRoom.id).toList();
}

addNewChatRoom(String email, String chatRoomId) async {
  String? response = await StorageRepository.get(email);
  if (response == null) {
    return null;
  }
  User user = User.fromJson(jsonDecode(response));
  user.chatRooms.add(ChatRoom(id: chatRoomId, messages: []));
  await StorageRepository.save(email, jsonEncode(user.toJson()));
}

addChatMessage(ChatMessage chatMessage, String chatRoomId, String email) async {
  String? response = await StorageRepository.get(email);
  if (response == null) {
    // print("helloword:Exit response null");
    return null;
  }
  User user = User.fromJson(jsonDecode(response));
  // print(user);
  List<ChatRoom> chatRooms = user.chatRooms;
  for (int i = 0; i < chatRooms.length; i++) {
    if (chatRooms[i].id == chatRoomId) {
      chatRooms[i].messages.add(chatMessage);
      break;
    }
  }
  saveUser(email, user);
}

Future<List<ChatMessage>> getChatRoomMessages(
    String chatRoomId, String email) async {
  String? response = await StorageRepository.get(email);
  if (response == null) {
    return [];
  }
  User user = User.fromJson(jsonDecode(response));
  List<ChatRoom> chatRooms = user.chatRooms;
  for (int i = 0; i < chatRooms.length; i++) {
    if (chatRooms[i].id == chatRoomId) {
      return chatRooms[i].messages;
    }
  }
  return [];
}
