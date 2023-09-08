part of rooms_part;

class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => context.read<LoginBloc>().add(LoginExited()),
          ),
          title: Text(locale.rooms),
        ),
        body: BlocConsumer<RoomsBloc, RoomsState>(
            listener: (context, state) {
              RoomsLoadSuccess _state = state as RoomsLoadSuccess;
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                      content: Text(
                          _state.connectionStatus == ConnectionStatus.connecting
                              ? 'соединение потеряно, переподключение...'
                              : 'соединение восстановлено')),
                );
            },
            listenWhen: (previous, current) =>
                (previous is RoomsLoadSuccess && current is RoomsLoadSuccess) &&
                current.connectionStatus != previous.connectionStatus,
            builder: (context, state) {
              if (state is RoomsLoadFailed)
                return ErrorScreen(
                    onRetryTapped: () => context
                        .read<RoomsBloc>()
                        .add(RoomsFetched(user: state.user)));
              else if (state is RoomsLoadSuccess)
                return RoomsDisplay(state: state);
              else
                return SplashScreen();
            }));
  }
}
