part of '../rooms_part.dart';

/// {@template roomsDataProvider}
/// Implementation of [IRoomsDataProvider] with production functionality.
/// {@endtemplate}
class RoomsDataProvider extends IRoomsDataProvider {
  @override
  Future<Map<String, dynamic>> downloadRooms() async {
    Response response = await Dio().get('https://nane.tada.team/api/rooms');
    return response.data;
  }
}
