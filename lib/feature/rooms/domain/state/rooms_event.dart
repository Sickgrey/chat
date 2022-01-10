import 'package:freezed_annotation/freezed_annotation.dart';

part 'rooms_event.freezed.dart';

@freezed
class RoomsEvent with _$RoomsEvent {
  const factory RoomsEvent.roomsListOpened() = RoomsListOpened;
}
