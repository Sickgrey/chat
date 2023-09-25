part of '../rooms_part.dart';

/// {@template iRoomsDataProvider}
/// Rooms data provider interface.
/// {@endtemplate}
abstract class IRoomsDataProvider {
  /// Returns rooms data.
  Future<Map<String, dynamic>> downloadRooms();
}
