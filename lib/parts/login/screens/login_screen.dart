part of '../login_part.dart';

/// {@template loginScreen}
/// Login screen.
/// {@endtemplate}
class LoginScreen extends StatelessWidget {
  /// {@macro loginScreen}
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencyContainer = context.read<DependencyContainer>();
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginInput) {
        return const LoginFormInput();
      } else if (state is LoginSuccess) {
        return RepositoryProvider(
          create: (context) => MessageRepository(user: state.user),
          child: BlocProvider(
            create: (context) => RoomsBloc(
              logger: dependencyContainer.logger,
              messageRepository: context.read<MessageRepository>(),
              roomsRepository: dependencyContainer.iRoomsRepository,
            )..add(RoomsOpened(user: state.user)),
            child: const Rooms(),
          ),
        );
      } else if (state is LoginFailed) {
        return AppErrorScreen(
          onRetryTapped: () => context.readLoginBloc.add(const LoginRetried()),
        );
      } else {
        return const AppLoadingScreen();
      }
    });
  }
}
