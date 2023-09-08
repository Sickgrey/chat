part of chat_part;

class ChatLog extends StatelessWidget {
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
