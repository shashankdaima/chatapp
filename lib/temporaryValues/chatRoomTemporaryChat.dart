enum ChatRole { user, socket }

class Chat {
  final String title;
  final DateTime creationTime;
  final ChatRole role;
  Chat({required this.title, required this.creationTime, required this.role});
}

