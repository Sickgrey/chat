part of chat_part;

/// {@template chatLog}
/// Chat log screen.
/// {@endtemplate}
class ChatLog extends StatelessWidget {
  /// {@macro chatLog}
  const ChatLog({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.chatLog),
      ),
      body: ListView(
        children: ChatLogger()
            .memoryOutput
            .buffer
            .map((element) => Text(element.lines.join()))
            .toList(),
      ),
    );
  }
}
