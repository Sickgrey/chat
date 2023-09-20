part of chat_part;

/// {@template messageInput}
/// Message input field.
/// {@endtemplate}
class MessageInput extends StatefulWidget {
  /// Message send callback.
  final ValueChanged<String> onMessageEntered;

  /// Chat is conntected.
  final bool isConnected;

  /// {@macro messageInput}
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
    final theme = context.theme;
    final locale = context.l10n;

    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 8),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: AppTextField(
                  controller: _textEditingController,
                  hintText: locale.sendAMessage,
                  maxLines: 4,
                ),
              ),
              IconButton(
                  color: theme.primaryColor,
                  icon: Icon(Icons.send),
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
