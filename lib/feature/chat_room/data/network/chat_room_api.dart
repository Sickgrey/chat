import 'dart:convert';

import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/chat_room/data/network/i_chat_room_api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/*

Клиент отправляет сообщения формата:
{
  "room": string, // название комнаты. Если такой комнаты нет, она будет создана
  "text": string, // текст сообщения
  "id": string // необязательный идентификатор, можно назначить на клиенте, чтобы получить подтверждение получения сообщения сервером
}


Сервер отправляет сообщения формата:
{
  "room": string,
  "text": string, 
  "id": string, // если передан клиентом при отправке. Сам сервер этот id не назначает, не использует и не отдаёт в /history
  "created": iso_datetime, // время создания сообщения 
  "sender": {"username": string} // информация об отправителе  
}

*/

class ChatRoomApi implements IChatRoomApi {
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://nane.tada.team/ws?username={username}'),
  );

  Stream<Message> get messageStream => channel.stream
      .map<Message>((value) => Message.fromJson(jsonDecode(value)));

  @override
  void sendMessage({required String room, required String text}) {
    final message = {
      "room": room,
      "text": text,
    };
    channel.sink.add(message);
  }

  @override
  void dispose() {
    channel.sink.close();
  }
}
