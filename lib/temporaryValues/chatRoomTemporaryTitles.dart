class ChatRoom {
  final String title;
  final DateTime creationTime;

  ChatRoom({required this.title, required this.creationTime});
}

List<ChatRoom> chatRooms = [
  ChatRoom(
      title: 'General',
      creationTime: DateTime.now().subtract(Duration(days: 1))),
  ChatRoom(
      title: 'Flutter Devs',
      creationTime: DateTime.now().subtract(Duration(days: 2))),
  ChatRoom(
      title: 'Dart Enthusiasts',
      creationTime: DateTime.now().subtract(Duration(hours: 10))),
  ChatRoom(
      title: 'Tech Talk',
      creationTime: DateTime.now().subtract(Duration(minutes: 30))),
];
