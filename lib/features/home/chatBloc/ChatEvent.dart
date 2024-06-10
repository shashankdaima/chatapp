part of 'ChatBloc.dart';

sealed class ChatEvent extends Equatable {}

final class ChatMessageAddedByUser extends ChatEvent {
  final String message;

  ChatMessageAddedByUser({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

final class ChatMessageAddedBySystem extends ChatEvent {
  final String message;

  ChatMessageAddedBySystem({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [this.message];
}

final class ConnectWs extends ChatEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class CloseWs extends ChatEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
