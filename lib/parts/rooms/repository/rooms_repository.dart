part of rooms_part;

class RoomsRepository {
  final RoomsDataProvider roomsDataProvider;

  const RoomsRepository({required this.roomsDataProvider});

  Future<List<Room>> downloadRooms() async {
    Map<String, dynamic> json = await roomsDataProvider.downloadRooms();
    if (json['result'] != null) {
      return (json['result'] as List).map((e) => Room.fromJson(e)).toList();
    } else
      throw Exception('Empty response');
  }
}
