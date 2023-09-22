part of rooms_part;

/// {@template roomsDisplay}
/// Rooms display screen.
/// {@endtemplate}
class RoomsDisplay extends StatefulWidget {
  /// Rooms state.
  final RoomsLoadSuccess state;

  /// {@macro roomsDisplay}
  const RoomsDisplay({super.key, required this.state});

  @override
  _RoomsDisplayState createState() => _RoomsDisplayState();
}

class _RoomsDisplayState extends State<RoomsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showBaseDialog(
          context,
          dialog: RepositoryProvider.value(
            value: context.read<MessageRepository>(),
            child: CreateRoom(user: widget.state.user),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.readRoomsBloc.add(
          RoomsFetched(user: widget.state.user),
        ),
        child: ListView(
          physics: ClampingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
          children: ListTile.divideTiles(
            context: context,
            tiles: widget.state.rooms.map((e) => ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => RepositoryProvider.value(
                            value: context.read<MessageRepository>(),
                            child: BlocProvider(
                              create: (context) => ChatBloc(
                                  messageRepository:
                                      context.read<MessageRepository>(),
                                  room: e.name,
                                  user: widget.state.user,
                                  chatRepository: ChatRepository(
                                      chatDataProvider: ChatDataProvider()))
                                ..add(ChatFetched()),
                              child: Chat(),
                            ),
                          ))),
                  title: Text(e.name),
                  subtitle: Text(
                    '${e.message.sender?.username ?? ''} : ${e.message.text}',
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                )),
          ).toList(),
        ),
      ),
    );
  }
}
