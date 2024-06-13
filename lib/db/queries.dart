part of "db.dart";

saveUser(String email, User user) async {
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
