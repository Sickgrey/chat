part of '../chat_part.dart';

/// {@template chatDataProvider}
/// Implementation of [IChatDataProvider] with production functionality.
/// {@endtemplate}
class ChatDataProvider implements IChatDataProvider {
  /// [Dio] instance.
  final Dio dio;

  /// {@macro chatDataProvider}
  const ChatDataProvider({required this.dio});

  @override
  Future<Map<String, dynamic>> downloadChatHistory(String room) async {
    Response response =
        await dio.get('rooms/${Uri.encodeComponent(room)}/history');
    return response.data;
  }
}
