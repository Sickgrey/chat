import 'package:chat/feature/rooms/data/entity/room_remote.dart';
import 'package:chat/feature/rooms/data/network/i_rooms_api.dart';
import 'package:dio/dio.dart';

/*
Настройки сервера: GET https://nane.tada.team/api/settings
Список комнат: GET https://nane.tada.team/api/rooms
История сообщений: GET https://nane.tada.team/api/rooms/{name}/history
*/

class RoomsApi implements IRoomsApi {
  RoomsApi() {
    final options = BaseOptions(
      baseUrl: 'https://nane.tada.team/api/',
      connectTimeout: 15000,
      receiveTimeout: 7000,
    );
    dio = Dio(options);
  }

  late final Dio dio;

  @override
  Future<List<RoomRemote>> loadRoomsList() async {
    final response = await dio.get('rooms');
    final data = response.data['result'] as List<dynamic>;
    List<RoomRemote> list =
        data.map((json) => RoomRemote.fromJson(json)).toList();
    return list;
  }
}
