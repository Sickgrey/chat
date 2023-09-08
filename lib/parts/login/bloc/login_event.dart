part of login_part;

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String username;

  const LoginSubmitted({required this.username});

  @override
  List<Object> get props => [username];
}

class LoginRetried extends LoginEvent {}

class LoginExited extends LoginEvent {}
