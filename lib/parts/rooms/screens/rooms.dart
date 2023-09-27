part of '../rooms_part.dart';

/// {@template rooms}
/// Rooms screen.
/// {@endtemplate}
class Rooms extends StatelessWidget {
  /// {@macro rooms}
  const Rooms({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.rooms),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: SettingsButton(),
          ),
        ],
      ),
      body: BlocConsumer<RoomsBloc, RoomsState>(
        listener: (context, state) {
          final currentState = state as RoomsLoadSuccess;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  currentState.connectionStatus == ConnectionStatus.connecting
                      ? locale.connectionLost
                      : locale.connectionRestored,
                ),
              ),
            );
        },
        listenWhen: (previous, current) =>
            (previous is RoomsLoadSuccess && current is RoomsLoadSuccess) &&
            current.connectionStatus != previous.connectionStatus,
        builder: (context, state) {
          if (state is RoomsLoadFailed) {
            return ErrorScreen(
              onRetryTapped: () => context.readRoomsBloc.add(
                RoomsFetched(user: state.user),
              ),
            );
          } else if (state is RoomsLoadSuccess) {
            return RoomsDisplay(state: state);
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
