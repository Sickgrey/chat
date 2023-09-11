part of rooms_part;

/// {@template iRoomsRepository}
/// Rooms repository interface.
/// {@endtemplate}
abstract class IRoomsRepository {
  /// Returns list of rooms.
  Future<List<Room>> downloadRooms();
}
