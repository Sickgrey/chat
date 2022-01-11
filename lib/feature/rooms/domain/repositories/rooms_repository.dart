import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/rooms/data/network/rooms_api.dart';
import 'package:chat/feature/rooms/domain/entity/room.dart';
import 'package:chat/feature/rooms/domain/repositories/i_rooms_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RoomsRepository implements IRoomsRepository {
  RoomsRepository({required this.roomsApi});

  @override
  final RoomsApi roomsApi;

  @override
  Future<List<Room>> loadRoomsList() async {
    final result = await roomsApi.loadRoomsList();
    return result.map((remote) => Room.fromRemote(remote)).toList();
  }

  @override
  Future<List<Message>> loadMessagesHistory({required String room}) async {
    final result = await roomsApi.loadMessagesHistory(room: room);
    return result;
  }
}
