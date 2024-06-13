part of 'ChatRoomBloc.dart';

class ChatRoomState extends Equatable {
  final List<String> roomIds;
  final String currentRoomId;
  final String email;

  // Default constructor with named parameters.
  ChatRoomState({
    required this.email, 
    required this.currentRoomId, 
    required this.roomIds,
  });

  // Named constructor for initial state with only email.
  ChatRoomState.initial({required this.email})
      : currentRoomId = '',
        roomIds = [];

  @override
  List<Object?> get props => [roomIds, currentRoomId, email];
}

final class ChatRoomInitial extends ChatRoomState {
  ChatRoomInitial(String email) : super.initial(email: email);
}
