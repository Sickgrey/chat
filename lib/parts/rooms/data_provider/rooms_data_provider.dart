part of '../rooms_part.dart';

/// {@template roomsDataProvider}
/// Implementation of [IRoomsDataProvider] with production functionality.
/// {@endtemplate}
class RoomsDataProvider implements IRoomsDataProvider {
  /// [Dio] instance.
  final Dio dio;

  /// {@macro roomsDataProvider}
  const RoomsDataProvider({required this.dio});

  @override
  Future<Map<String, dynamic>> downloadRooms() async {
    Response response = await dio.get('rooms');
    return response.data;
  }
}
