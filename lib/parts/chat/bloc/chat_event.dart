part of '../chat_part.dart';

/// {@template chatEvent}
/// Abstract event class for [ChatBloc].
/// {@endtemplate}
abstract class ChatEvent {
  /// {@macro chatEvent}
  const ChatEvent();
}

/// {@template chatFetched}
/// Fetch chat data event.
/// {@endtemplate}
class ChatFetched extends ChatEvent {
  /// It's new room.
  final bool isRoomNew;

  /// {@macro chatFetched}
  const ChatFetched({this.isRoomNew = false});
}

/// {@template chatMessageSent}
/// Message sent event.
/// {@endtemplate}
class ChatMessageSent extends ChatEvent {
  /// Message text.
  final String text;

  /// {@macro chatMessageSent}
  ChatMessageSent({required this.text});
}

/// {@template chatMessageReceived}
/// Message received event.
/// {@endtemplate}
class ChatMessageReceived extends ChatEvent {
  /// Message.
  final Message message;

  /// {@macro chatMessageReceived}
  ChatMessageReceived({required this.message});
}

/// {@template chatConnectionStatusChanged}
/// Chat connection status changed event.
/// {@endtemplate}
class ChatConnectionStatusChanged extends ChatEvent {
  /// Connection status.
  final ConnectionStatus status;

  /// {@macro chatConnectionStatusChanged}
  ChatConnectionStatusChanged({required this.status});
}
