part of rooms_part;

/// {@tempalte createRoom}
/// Create room screen.
/// {@endtempllate}
class CreateRoom extends StatefulWidget {
  /// User.
  final User user;

  /// {@macro createRoom}
  const CreateRoom({super.key, required this.user});

  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final _formKey = GlobalKey<FormState>();
  var _roomName = '';

  void _tryCreate() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => RepositoryProvider.value(
            value: context.read<MessageRepository>(),
            child: BlocProvider(
              create: (context) => ChatBloc(
                messageRepository: context.read<MessageRepository>(),
                room: _roomName,
                user: widget.user,
                chatRepository: ChatRepository(
                  chatDataProvider: ChatDataProvider(),
                ),
              )..add(ChatFetched(isRoomNew: true)),
              child: Chat(),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final locale = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              locale.roomName,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.primaryColorDark,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextFormField(
                autocorrect: true,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                enableSuggestions: false,
                validator: (value) {
                  final length = value?.length ?? 0;

                  if ((value?.isEmpty ?? true) || length < 3) {
                    return locale.roomNameMinLengthError;
                  } else if (length > 20) {
                    return locale.roomNameMaxLengthError;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: theme.primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: theme.colorScheme.error),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  fillColor: theme.splashColor,
                  filled: true,
                ),
                onSaved: (value) {
                  //  TODO: null check
                  _roomName = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: AppOutlinedButton(
                width: double.infinity,
                child: Text(locale.createRoom),
                onPressed: _tryCreate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
