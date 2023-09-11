part of chat_part;

/// {@template chatRepository}
/// Implementation of [IChatRepository] with production functionality.
/// {@endtemplate}
class ChatRepository extends IChatRepository {
  /// Instance of [IChatDataProvider].
  final IChatDataProvider chatDataProvider;

  /// {@macro chatRepository}
  ChatRepository({required this.chatDataProvider});

  @override
  Future<List<Message>> downloadChatHistory(
    String username,
    String room,
  ) async {
    final json = await chatDataProvider.downloadChatHistory(room);

    if (json['result'] != null) {
      return (json['result'] as List)
          .map((e) => parseMessage(e, username))
          .toList();
    } else {
      return [];
    }
  }
}
