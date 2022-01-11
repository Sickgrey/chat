import 'package:chat/feature/rooms/data/entity/room_remote.dart';

abstract class IRoomsApi {
  Future<List<RoomRemote>> loadRoomsList();
  Future<void> loadMessagesHistory({required String room});
}
