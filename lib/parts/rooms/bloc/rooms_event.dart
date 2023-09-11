part of rooms_part;

/// {@template roomsEvent}
/// Abstract event class for [RoomsBloc].
/// {@endtemplate}
abstract class RoomsEvent {
  /// {@macro roomsEvent}
  const RoomsEvent();
}

/// {@template roomsOpened}
/// Rooms opened event.
/// {@endtemplate}
class RoomsOpened extends RoomsEvent {
  /// User.
  final User user;

  /// {@macro roomsOpened}
  const RoomsOpened({required this.user});
}

/// {@template roomsFetched}
/// Rooms fetched event.
/// {@endtemplate}
class RoomsFetched extends RoomsEvent {
  /// User.
  final User user;

  /// {@macro roomsFetched}
  const RoomsFetched({required this.user});
}

/// {@template roomsConnectionStatusChanged}
/// Rooms connection status changed event.
/// {@endtemplate}
class RoomsConnectionStatusChanged extends RoomsEvent {
  /// Connection status.
  final ConnectionStatus connectionStatus;

  /// {@macro roomsConnectionStatusChanged}
  const RoomsConnectionStatusChanged({required this.connectionStatus});
}

/// {@template roomsMessageReceived}
/// Rooms message received event.
/// {@endtemplate}
class RoomsMessageReceived extends RoomsEvent {
  /// Message.
  final Message message;

  /// {@macro roomsMessageReceived}
  const RoomsMessageReceived({required this.message});
}
