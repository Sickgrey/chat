part of chat_part;

class MessageInput extends StatefulWidget {
  final ValueChanged<String> onMessageEntered;
  final bool isConnected;

  const MessageInput({
    required this.onMessageEntered,
    required this.isConnected,
  });

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(hintText: locale.sendAMessage),
                ),
              ),
              IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(
                    Icons.send,
                  ),
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      if (FocusScope.of(context).hasFocus)
                        FocusScope.of(context).unfocus();
                      widget.onMessageEntered(_textEditingController.text);

                      _textEditingController.clear();
                    }
                  })
            ],
          ),
          if (!widget.isConnected)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(locale.youAreOffline),
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
