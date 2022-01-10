import 'package:chat/feature/rooms/domain/repositories/rooms_repository.dart';
import 'package:chat/feature/rooms/domain/state/rooms_event.dart';
import 'package:chat/feature/rooms/domain/state/rooms_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc({required this.roomsRepository})
      : super(const RoomsState.loading()) {
    on<RoomsListOpened>(_fetchRoomsList);
  }

  RoomsRepository roomsRepository;

  _fetchRoomsList(RoomsListOpened event, Emitter<RoomsState> emit) async {
    try {
      final rooms = await roomsRepository.loadRoomsList();
      emit(RoomsState.success(rooms: rooms));
    } catch (e) {
      emit(const RoomsState.failure());
    }
  }
}
