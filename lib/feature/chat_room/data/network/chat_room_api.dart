import 'dart:async';
import 'dart:convert';

import 'package:chat/app/data/entity/message.dart';
import 'package:chat/app/domain/user_data_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@Injectable()
class ChatRoomApi {
  late final WebSocketChannel channel;
  final UserDataProvider userDataProvider;

  ChatRoomApi({required this.userDataProvider});

  void initWebSocketConnection({required String userName}) {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://nane.tada.team/ws?username=$userName'),
    );
  }

  Stream<Message> get messageStream => channel.stream
      .map<Message>((value) => Message.fromJson(jsonDecode(value)));

  void sendMessage({required String room, required String text}) {
    final message = {
      "room": room,
      "text": text,
    };
    channel.sink.add(jsonEncode(message));
  }
}
