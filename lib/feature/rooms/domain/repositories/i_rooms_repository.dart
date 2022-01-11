import 'package:chat/feature/rooms/domain/entity/room.dart';

abstract class IRoomsRepository {
  Future<List<Room>> loadRoomsList();
  Future<void> loadMessagesHistory({required String room});
}
