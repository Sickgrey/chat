part of rooms_part;

class CreateRoom extends StatefulWidget {
  final User user;

  const CreateRoom({required this.user});

  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final _formKey = GlobalKey<FormState>();
  var _roomName = '';

  void _tryCreate() {
    //  TODO: null check
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => RepositoryProvider.value(
                value: context.read<MessageRepository>(),
                child: BlocProvider(
                  create: (context) => ChatBloc(
                      messageRepository: context.read<MessageRepository>(),
                      room: _roomName,
                      user: widget.user,
                      chatRepository:
                          ChatRepository(chatDataProvider: ChatDataProvider()))
                    ..add(ChatFetched(isRoomNew: true)),
                  child: Chat(),
                ),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Создать комнату"),
        ),
        body: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      autocorrect: true,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      validator: (value) {
                        //  TODO: refactor
                        if (value != null) {
                          if (value.isEmpty || value.length < 3) {
                            return 'Пожалуйста введите более 3-х символов';
                          } else if (value.length > 20) {
                            return 'Имя не должно содержать больше 20 символов';
                          } else {
                            return value;
                          }
                        } else {
                          return value;
                        }
                      },
                      decoration:
                          const InputDecoration(labelText: 'Имя комнаты'),
                      onSaved: (value) {
                        //  TODO: null check
                        _roomName = value!;
                      },
                    ),
                    SizedBox(height: 12),
                    OutlinedButton(
                      child: const Text('Создать комнату'),
                      onPressed: _tryCreate,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
