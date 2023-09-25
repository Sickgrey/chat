part of '../rooms_part.dart';

/// {@template iRoomsRepository}
/// Rooms repository interface.
/// {@endtemplate}
abstract class IRoomsRepository {
  /// Returns list of rooms.
  Future<List<Room>> downloadRooms();
}
