part of '../chat_part.dart';

/// {@template chatState}
/// Abstract state class for [ChatBloc].
/// {@endtemplate}
abstract class ChatState extends Equatable {
  /// {@macro chatState}
  const ChatState();

  @override
  List<Object> get props => [];
}

/// {@template chatInitial}
/// Initial state.
/// {@endtemplate}
class ChatInitial extends ChatState {
  /// {@macro chatInitial}
  const ChatInitial();
}

/// {@template chatLoadSuccess}
/// Load success state.
/// {@endtemplate}
class ChatLoadSuccess extends ChatState {
  /// Connection status.
  final ConnectionStatus connectionStatus;

  /// List of messages.
  final List<Message> messages;

  /// User.
  final User user;

  /// Room name.
  final String room;

  /// {@macro chatLoadSuccess}
  const ChatLoadSuccess({
    required this.connectionStatus,
    required this.room,
    required this.messages,
    required this.user,
  });

  @override
  List<Object> get props => [connectionStatus, messages, user, room];

  /// Current state update function.
  ChatLoadSuccess copyWith({
    ConnectionStatus? connectionStatus,
    List<Message>? messages,
  }) =>
      ChatLoadSuccess(
        room: room,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        messages: messages ?? this.messages,
        user: user,
      );
}
