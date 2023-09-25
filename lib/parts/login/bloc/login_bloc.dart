part of '../login_part.dart';

/// {@template loginBloc}
/// Login control bloc.
/// {@endtemplate}
class LoginBloc extends HydratedBloc<LoginEvent, LoginState> {
  /// {@macro loginBloc}
  LoginBloc() : super(LoginInput()) {
    on(_onLoginSubmitted);
    on(_onLoginRetried);
    on(_onLoginExited);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final status =
        await ConnectivityCheckService.connectivityCheck(['nane.tada.team']);
    if (status == ConnectionStatus.active) {
      emit(
          LoginSuccess(user: User(username: event.username, uid: Uuid().v1())));
    } else {
      emit(LoginFailed());
    }
  }

  void _onLoginRetried(LoginRetried event, Emitter<LoginState> emit) =>
      emit(LoginInput());

  Future<void> _onLoginExited(
    LoginExited event,
    Emitter<LoginState> emit,
  ) async {
    await HydratedBloc.storage.clear();
    emit(LoginInput());
  }

  @override
  LoginState fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'LoginSuccess')
      return LoginSuccess(user: User.fromJson(json['user']));
    else
      return LoginInput();
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    if (state is LoginSuccess)
      return {'type': 'LoginSuccess', 'user': state.user.toJson()};
    else if (state is LoginInput)
      return {'type': 'LoginInput'};
    else
      return null;
  }
}

/// Context extension for quick access to [LoginBloc].
extension LoginBlocBuildContextX on BuildContext {
  /// Instance of [LoginBloc].
  LoginBloc get readLoginBloc => read<LoginBloc>();
}
