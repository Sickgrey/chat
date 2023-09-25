part of '../chat_part.dart';

/// {@template chatDataProvider}
/// Implementation of [IChatDataProvider] with production functionality.
/// {@endtemplate}
class ChatDataProvider implements IChatDataProvider {
  @override
  Future<Map<String, dynamic>> downloadChatHistory(String room) async {
    Response response = await Dio().get(
        'https://nane.tada.team/api/rooms/${Uri.encodeComponent(room)}/history');
    return response.data;
  }
}
