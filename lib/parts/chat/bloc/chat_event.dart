part of chat_part;

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatFetched extends ChatEvent {
  final bool isRoomNew;

  const ChatFetched({this.isRoomNew = false});

  @override
  List<Object> get props => [isRoomNew];
}

class ChatMessageSent extends ChatEvent {
  final String text;

  ChatMessageSent({required this.text});

  @override
  List<Object> get props => [text];
}

class ChatMessageReceived extends ChatEvent {
  final Message message;

  ChatMessageReceived({required this.message});

  @override
  List<Object> get props => [message];
}

class ChatConnectionStatusChanged extends ChatEvent {
  final ConnectionStatus status;

  ChatConnectionStatusChanged({required this.status});

  @override
  List<Object> get props => [status];
}
