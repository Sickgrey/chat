import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/rooms/data/network/rooms_api.dart';
import 'package:chat/feature/rooms/domain/entity/room.dart';

abstract class IRoomsRepository {
  final RoomsApi roomsApi;

  IRoomsRepository({required this.roomsApi});

  Future<List<Room>> loadRoomsList();

  Future<List<Message>> loadMessagesHistory({required String room});
}
