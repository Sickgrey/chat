import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/rooms/domain/entity/room.dart';

abstract class IRoomsRepository {
  Future<List<Room>> loadRoomsList();
  Future<List<Message>> loadMessagesHistory({required String room});
}
