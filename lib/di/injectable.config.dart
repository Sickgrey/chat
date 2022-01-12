// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/data/network_service/dio_container.dart' as _i3;
import '../app/domain/user_data_provider.dart' as _i6;
import '../feature/chat_room/data/network/chat_room_api.dart' as _i7;
import '../feature/chat_room/domain/repositories/chat_room_repository.dart'
    as _i8;
import '../feature/rooms/data/network/rooms_api.dart' as _i4;
import '../feature/rooms/domain/repositories/rooms_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DioContainer>(() => _i3.DioContainer());
  gh.factory<_i4.RoomsApi>(
      () => _i4.RoomsApi(dioContainer: get<_i3.DioContainer>()));
  gh.factory<_i5.RoomsRepository>(
      () => _i5.RoomsRepository(roomsApi: get<_i4.RoomsApi>()));
  gh.factory<_i6.UserDataProvider>(() => _i6.UserDataProvider());
  gh.factory<_i7.ChatRoomApi>(
      () => _i7.ChatRoomApi(userDataProvider: get<_i6.UserDataProvider>()));
  gh.factory<_i8.ChatRoomRepository>(
      () => _i8.ChatRoomRepository(chatRoomApi: get<_i7.ChatRoomApi>()));
  return get;
}
