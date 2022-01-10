import 'package:chat/feature/rooms/domain/entity/room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rooms_state.freezed.dart';

@freezed
class RoomsState with _$RoomsState {
  const factory RoomsState.loading() = RoomsLoading;

  const factory RoomsState.success({required List<Room> rooms}) = RoomssSuccess;

  const factory RoomsState.failure() = RoomsFailure;
}
