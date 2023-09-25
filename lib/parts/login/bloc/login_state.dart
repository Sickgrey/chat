part of '../login_part.dart';

/// {@template loginState}
/// Abstract state class for [LoginBloc].
/// {@endtemplate}
abstract class LoginState extends Equatable {
  /// {@macro loginState}
  const LoginState();

  @override
  List<Object> get props => [];
}

/// {@template loginInput}
/// Login input state.
/// {@endtemplate}
class LoginInput extends LoginState {
  /// {@macro loginInput}
  const LoginInput();
}

/// {@template loginSuccess}
/// Login success state.
/// {@endtemplate}
class LoginSuccess extends LoginState {
  /// User.
  final User user;

  /// {@macro loginSuccess}
  const LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

/// {@template loginFailed}
/// Login failed state.
/// {@endtemplate}
class LoginFailed extends LoginState {
  /// {@macro loginFailed}
  const LoginFailed();
}
