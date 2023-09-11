part of rooms_part;

/// {@template roomsRepository}
/// Implementation of [IRoomsRepository] with production functionality.
/// {@endtemplate}
class RoomsRepository extends IRoomsRepository {
  /// Instance of [IRoomsDataProvider].
  final IRoomsDataProvider roomsDataProvider;

  /// {@macro roomsRepository}
  RoomsRepository({required this.roomsDataProvider});

  @override
  Future<List<Room>> downloadRooms() async {
    Map<String, dynamic> json = await roomsDataProvider.downloadRooms();
    if (json['result'] != null) {
      return (json['result'] as List).map((e) => Room.fromJson(e)).toList();
    } else
      throw Exception('Empty response');
  }
}
