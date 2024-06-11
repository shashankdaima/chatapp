part of 'ChatBloc.dart';

sealed class ChatEvent extends Equatable {}

final class ChatMessageAddedByUser extends ChatEvent {
  final String message;

  ChatMessageAddedByUser({required this.message});

  @override
  List<Object?> get props => [this.message];
}
final class ChatMessageAddedBySystem extends ChatEvent {
  final String message;

  ChatMessageAddedBySystem({required this.message});

  @override

  List<Object?> get props => [this.message];
}


final class OpenWs extends ChatEvent {
  @override
  List<Object?> get props => [];
}


final class CloseWs extends ChatEvent {
  @override
  List<Object?> get props => [];
}
