part of rooms_part;

/// {@template chatState}
/// Abstract state class for [RoomsBloc].
/// {@endtemplate}
abstract class RoomsState extends Equatable {
  /// {@macro chatState}
  const RoomsState();

  @override
  List<Object> get props => [];
}

/// {@template roomsInitial}
/// Initial state.
/// {@endtemplate}
class RoomsInitial extends RoomsState {
  /// {@macro roomsInitial}
  const RoomsInitial();
}

/// {@template roomsLoadSuccess}
/// Load success state.
/// {@endtemplate}
class RoomsLoadSuccess extends RoomsState {
  /// List of rooms.
  final List<Room> rooms;

  /// User.
  final User user;

  /// Connection status.
  final ConnectionStatus connectionStatus;

  /// {@macro roomsLoadSuccess}
  const RoomsLoadSuccess({
    required this.rooms,
    required this.user,
    required this.connectionStatus,
  });

  @override
  List<Object> get props => [rooms, user, connectionStatus];

  /// Current state update function.
  RoomsLoadSuccess copyWith({
    List<Room>? rooms,
    User? user,
    ConnectionStatus? connectionStatus,
  }) =>
      RoomsLoadSuccess(
        rooms: rooms ?? this.rooms,
        user: user ?? this.user,
        connectionStatus: connectionStatus ?? this.connectionStatus,
      );
}

/// {@template roomsLoadFailed}
/// Load failed state.
/// {@endtemplate}
class RoomsLoadFailed extends RoomsState {
  /// User.
  final User user;

  /// {@macro roomsLoadFailed}
  const RoomsLoadFailed({required this.user});
}
