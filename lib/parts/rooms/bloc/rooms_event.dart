part of rooms_part;

abstract class RoomsEvent extends Equatable {
  const RoomsEvent();

  @override
  List<Object> get props => [];
}

class RoomsOpened extends RoomsEvent {
  final User user;

  const RoomsOpened({required this.user});

  @override
  List<Object> get props => [user];
}

class RoomsFetched extends RoomsEvent {
  final User user;

  const RoomsFetched({required this.user});

  @override
  List<Object> get props => [user];
}

class RoomsConnectionStatusChanged extends RoomsEvent {
  final ConnectionStatus connectionStatus;

  const RoomsConnectionStatusChanged({required this.connectionStatus});

  @override
  List<Object> get props => [connectionStatus];
}

class RoomsMessageReceived extends RoomsEvent {
  final Message message;

  const RoomsMessageReceived({required this.message});

  @override
  List<Object> get props => [message];
}
