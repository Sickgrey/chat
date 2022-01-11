import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/rooms/data/entity/room_remote.dart';

abstract class IRoomsApi {
  Future<List<RoomRemote>> loadRoomsList();
  Future<List<Message>> loadMessagesHistory({required String room});
}
