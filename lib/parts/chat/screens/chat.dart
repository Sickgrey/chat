part of chat_part;

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      if (state is ChatLoadSuccess) {
        return ChatMain(state: state);
      } else
        return SplashScreen();
    });
  }
}
