part of rooms_part;

/// {@template roomsBloc}
/// Rooms control bloc.
/// {@endtemplate}
class RoomsBloc extends HydratedBloc<RoomsEvent, RoomsState> {
  /// Instance of [IRoomsRepository].
  final IRoomsRepository roomsRepository;

  /// Instance of [IMessageRepository].
  final IMessageRepository messageRepository;

  /// Subscription to events to receive message.
  StreamSubscription<Message>? messageSubscription;

  /// Subscription to events to update [ConnectionStatus].
  StreamSubscription<ConnectionStatus>? connectionStatusSubscription;

  /// {@macro roomsBloc}
  RoomsBloc({
    required this.roomsRepository,
    required this.messageRepository,
  }) : super(RoomsInitial()) {
    messageSubscription = messageRepository.messageStream.listen(
      (event) => add(RoomsMessageReceived(message: event)),
    );
    connectionStatusSubscription = messageRepository.connectionStatusStream
        .distinct()
        .listen((event) =>
            add(RoomsConnectionStatusChanged(connectionStatus: event)));

    on(_onRoomsOpened);
    on(_onRoomsFetched);
    on(_onRoomsConnectionStatusChanged);
    on(_onRoomsMessageReceived);
  }

  Future<void> _onRoomsOpened(
    RoomsOpened event,
    Emitter<RoomsState> emit,
  ) async {
    if (state is! RoomsLoadSuccess) {
      add(RoomsFetched(user: event.user));
    }
  }

  Future<void> _onRoomsFetched(
    RoomsFetched event,
    Emitter<RoomsState> emit,
  ) async {
    try {
      //  TODO: null check
      List<Room> rooms = await roomsRepository.downloadRooms();
      rooms.sort((a, b) => -a.message.created!.compareTo(b.message.created!));

      emit(RoomsLoadSuccess(
          user: event.user,
          rooms: rooms,
          connectionStatus: ConnectionStatus.active));
    } catch (e) {
      //  TODO: add logging
      print(e);
      emit(RoomsLoadFailed(user: event.user));
    }
  }

  Future<void> _onRoomsConnectionStatusChanged(
    RoomsConnectionStatusChanged event,
    Emitter<RoomsState> emit,
  ) async {
    if (state is RoomsLoadSuccess) {
      final currentState = state as RoomsLoadSuccess;
      emit(currentState.copyWith(connectionStatus: event.connectionStatus));
      if (event.connectionStatus == ConnectionStatus.active) {
        add(RoomsFetched(user: (state as RoomsLoadSuccess).user));
      }
    } else if (state is RoomsLoadFailed) {
      if (event.connectionStatus == ConnectionStatus.active)
        add(RoomsFetched(user: (state as RoomsLoadFailed).user));
    }
  }

  Future<void> _onRoomsMessageReceived(
    RoomsMessageReceived event,
    Emitter<RoomsState> emit,
  ) async {
    if (state is RoomsLoadSuccess) {
      final currentState = state as RoomsLoadSuccess;

      List<Room> rooms = List.from((state as RoomsLoadSuccess).rooms);
      Room room =
          rooms.firstWhere((element) => element.name == event.message.room);
      if (room != null) {
        rooms[rooms.indexOf(room)] = room.copyWith(message: event.message);
      } else {
        rooms.add(Room(name: event.message.room, message: event.message));
      }

      //  TODO: null check
      rooms.sort((a, b) => -a.message.created!.compareTo(b.message.created!));
      emit(currentState.copyWith(rooms: rooms));
    }
  }

  @override
  RoomsState fromJson(Map<String, dynamic> json) {
    return RoomsLoadSuccess(
        user: User.fromJson(json['user']),
        rooms: (json['rooms'] as List).map((e) => Room.fromJson(e)).toList(),
        connectionStatus: ConnectionStatus.values
            .firstWhere((element) => element.toString() == json['connection']));
  }

  @override
  Map<String, dynamic>? toJson(RoomsState state) {
    if (state is RoomsLoadSuccess)
      return {
        'user': state.user.toJson(),
        'rooms': state.rooms.map((e) => e.toJson()).toList(),
        'connection': state.connectionStatus.toString()
      };
    else
      return null;
  }

  @override
  Future<void> close() {
    messageRepository.dispose();
    messageSubscription?.cancel();
    connectionStatusSubscription?.cancel();
    return super.close();
  }
}

/// Context extension for quick access to [RoomsBloc].
extension RoomsBlocBuildContextX on BuildContext {
  /// Instance of [RoomsBloc].
  RoomsBloc get readRoomsBloc => read<RoomsBloc>();
}
