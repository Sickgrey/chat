part of chat_part;

/// {@template chat}
/// Chat screen wrapper.
/// {@endtemplate}
class Chat extends StatelessWidget {
  /// {@macro chat}
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is ChatLoadSuccess) {
          return ChatMain(state: state);
        } else
          return SplashScreen();
      },
    );
  }
}
