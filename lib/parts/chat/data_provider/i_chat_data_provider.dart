part of chat_part;

/// {@template iChatDataProvider}
/// Chat data provider interface.
/// {@endtemplate}
abstract class IChatDataProvider {
  /// Returns chat history data.
  Future<Map<String, dynamic>> downloadChatHistory(String room);
}
