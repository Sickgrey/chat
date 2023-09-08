part of chat_part;

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoadSuccess extends ChatState {
  final ConnectionStatus connectionStatus;
  final List<Message> messages;
  final User user;
  final String room;

  ChatLoadSuccess({
    required this.connectionStatus,
    required this.room,
    required this.messages,
    required this.user,
  });

  @override
  List<Object> get props => [connectionStatus, messages, user, room];

  ChatLoadSuccess copyWith({
    ConnectionStatus? connectionStatus,
    List<Message>? messages,
  }) {
    return ChatLoadSuccess(
      room: room,
      connectionStatus: connectionStatus ?? this.connectionStatus,
      messages: messages ?? this.messages,
      user: user,
    );
  }
}
