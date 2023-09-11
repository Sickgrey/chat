part of rooms_part;

/// {@template iMessageRepository}
/// Message repository interface.
/// {@endtemplate}
abstract class IMessageRepository {
  /// Getting [Message] data from stream.
  Stream<Message> get messageStream;

  /// Getting [ConnectionStatus] data from stream.
  Stream<ConnectionStatus> get connectionStatusStream;

  /// Sending a message.
  void sendMessage(Message message);

  /// Resource release.
  void dispose();
}
