part of '../login_part.dart';

/// {@template loginEvent}
/// Abstract event class for [LoginBloc].
/// {@endtemplate}
abstract class LoginEvent {
  /// {@macro loginEvent}
  const LoginEvent();
}

/// {@template loginSubmitted}
/// Login submitted event.
/// {@endtemplate}
class LoginSubmitted extends LoginEvent {
  /// Username.
  final String username;

  /// {@macro loginSubmitted}
  const LoginSubmitted({required this.username});
}

/// {@template loginRetried}
/// Login retried event.
/// {@endtemplate}
class LoginRetried extends LoginEvent {
  /// {@macro loginRetried}
  const LoginRetried();
}

/// {@template loginExited}
/// Login exited event.
/// {@endtemplate}
class LoginExited extends LoginEvent {
  /// {@macro loginExited}
  const LoginExited();
}
