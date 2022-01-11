import 'package:get_it/get_it.dart';

T getIt<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) {
  return GetIt.instance.get<T>(
    instanceName: instanceName,
    param1: param1,
    param2: param2,
  );
}

Future<T> getItAsync<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) {
  return GetIt.instance.getAsync<T>(
    instanceName: instanceName,
    param1: param1,
    param2: param2,
  );
}
