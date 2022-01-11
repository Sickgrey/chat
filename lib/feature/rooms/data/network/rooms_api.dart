import 'package:chat/app/data/entity/message.dart';
import 'package:chat/app/data/network_service/dio_container.dart';
import 'package:chat/feature/rooms/data/entity/room_remote.dart';
import 'package:chat/feature/rooms/data/network/i_rooms_api.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RoomsApi implements IRoomsApi {
  RoomsApi({required this.dioContainer});

  final DioContainer dioContainer;

  @override
  Future<List<RoomRemote>> loadRoomsList() async {
    final response = await dioContainer.dio.get('rooms');
    final data = response.data['result'] as List<dynamic>;
    List<RoomRemote> list =
        data.map((json) => RoomRemote.fromJson(json)).toList();
    return list;
  }

  @override
  Future<List<Message>> loadMessagesHistory({required String room}) async {
    final response = await dioContainer.dio.get('rooms/$room/history');
    final data = response.data['result'] as List<dynamic>;
    List<Message> list = data.map((json) => Message.fromJson(json)).toList();
    return list;
  }
}
