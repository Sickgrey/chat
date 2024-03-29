import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat/root/root.dart';

/// The cubit is for showing and changing the application's [Environment].
class EnvironmentCubit extends Cubit<Environment> {
  /// Creates the [EnvironmentCubit] that uses
  /// the given [environment] as the initial state.
  EnvironmentCubit(Environment environment) : super(environment);

  /// Changes the current environment to the given [environment]
  /// that the application will use.
  void changeEnvironment(Environment environment) => emit(environment);
}
