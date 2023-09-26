part of '../rooms_part.dart';

/// {@tempalte createRoom}
/// Create room screen.
/// {@endtempllate}
class CreateRoom extends StatefulWidget {
  /// User.
  final User user;

  /// {@macro createRoom}
  const CreateRoom({super.key, required this.user});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
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
                logger: context.read<DependencyContainer>().logger,
                messageRepository: context.read<MessageRepository>(),
                room: _roomName,
                user: widget.user,
                chatRepository: ChatRepository(
                  chatDataProvider: ChatDataProvider(),
                ),
              )..add(const ChatFetched(isRoomNew: true)),
              child: const Chat(),
            ),
          ),
        ),
      );
      context.readRoomsBloc.add(RoomsFetched(user: widget.user));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final locale = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
              child: AppTextFormField(
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
                onPressed: _tryCreate,
                child: Text(locale.createRoom),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
