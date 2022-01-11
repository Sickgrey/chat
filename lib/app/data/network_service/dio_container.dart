import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DioContainer {
  DioContainer() {
    final options = BaseOptions(
      baseUrl: 'https://nane.tada.team/api/',
      connectTimeout: 15000,
      receiveTimeout: 7000,
    );
    dio = Dio(options);
  }

  late final Dio dio;
}
