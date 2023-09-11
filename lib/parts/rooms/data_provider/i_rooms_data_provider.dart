part of rooms_part;

/// {@template iRoomsDataProvider}
/// Rooms data provider interface.
/// {@endtemplate}
abstract class IRoomsDataProvider {
  /// Returns rooms data.
  Future<Map<String, dynamic>> downloadRooms();
}
