part of '../chat_part.dart';

/// {@template iChatRepository}
/// Chat repository interface.
/// {@endtemplate}
abstract class IChatRepository {
  /// Returns chat history messages.
  Future<List<Message>> downloadChatHistory(String username, String room);
}
