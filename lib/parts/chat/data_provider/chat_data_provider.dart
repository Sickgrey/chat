part of chat_part;

/// {@template chatDataProvider}
/// Implementation of [IChatDataProvider] with production functionality.
/// {@endtemplate}
class ChatDataProvider extends IChatDataProvider {
  @override
  Future<Map<String, dynamic>> downloadChatHistory(String room) async {
    Response response = await Dio().get(
        'https://nane.tada.team/api/rooms/${Uri.encodeComponent(room)}/history');
    return response.data;
  }
}
