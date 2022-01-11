import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/chat_room/data/network/chat_room_api.dart';
import 'package:chat/feature/chat_room/domain/repositories/i_chat_room_repository.dart';

class ChatRoomRepository implements IChatRoomRepository {
  ChatRoomApi chatRoomApi = ChatRoomApi();

  Stream<Message> get messageStream async* {
    yield* chatRoomApi.messageStream;
  }

  @override
  void sendMessage({required String room, required String text}) {
    chatRoomApi.sendMessage(room: room, text: text);
  }

  @override
  void dispose() {
    chatRoomApi.dispose();
  }
}
