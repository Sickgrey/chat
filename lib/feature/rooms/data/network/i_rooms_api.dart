import 'package:chat/feature/rooms/data/entity/room_remote.dart';

abstract class IRoomsApi {
  Future<List<RoomRemote>> loadRoomsList();
}
