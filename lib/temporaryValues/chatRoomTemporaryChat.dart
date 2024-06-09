enum ChatRole { user, socket }

class Chat {
  final String title;
  final DateTime creationTime;
  final ChatRole role;
  Chat({required this.title, required this.creationTime, required this.role});
}

List<Chat> hardcodedChats = [
  Chat(
    title: "Hello!",
    creationTime: DateTime.now().subtract(Duration(days: 1)),
    role: ChatRole.user,
  ),
  Chat(
    title: "How are you?",
    creationTime: DateTime.now().subtract(Duration(hours: 3)),
    role: ChatRole.socket,
  ),
  Chat(
    title: "Good morning",
    creationTime: DateTime.now().subtract(Duration(days: 2)),
    role: ChatRole.user,
  ),
  Chat(
    title: "What's up?",
    creationTime: DateTime.now().subtract(Duration(minutes: 30)),
    role: ChatRole.socket,
  ),
  Chat(
    title: "Nice weather today!",
    creationTime: DateTime.now().subtract(Duration(days: 1, hours: 4)),
    role: ChatRole.user,
  ),
  Chat(
    title: "Long time no see",
    creationTime: DateTime.now().subtract(Duration(days: 3)),
    role: ChatRole.socket,
  ),
  Chat(
    title: "Hey there!",
    creationTime: DateTime.now().subtract(Duration(hours: 2)),
    role: ChatRole.user,
  ),
  Chat(
    title: "How's your day?",
    creationTime: DateTime.now().subtract(Duration(days: 1, hours: 5)),
    role: ChatRole.socket,
  ),
  Chat(
    title: "What are you up to?",
    creationTime: DateTime.now().subtract(Duration(days: 2, hours: 3)),
    role: ChatRole.user,
  ),
  Chat(
    title: "Good evening",
    creationTime: DateTime.now().subtract(Duration(days: 2, hours: 6)),
    role: ChatRole.socket,
  ),
];
