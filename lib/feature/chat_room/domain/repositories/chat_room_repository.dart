import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/chat_room/data/network/chat_room_api.dart';
import 'package:chat/feature/chat_room/domain/repositories/i_chat_room_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ChatRoomRepository implements IChatRoomRepository {
  final ChatRoomApi chatRoomApi;

  ChatRoomRepository({required this.chatRoomApi});

  Stream<Message> get messageStream {
    return chatRoomApi.messageStream;
  }

  @override
  void sendMessage({required String room, required String text}) {
    chatRoomApi.sendMessage(room: room, text: text);
  }

  @override
  void initWebSocketConnection({required String userName}) {
    chatRoomApi.initWebSocketConnection(userName: userName);
  }
}
