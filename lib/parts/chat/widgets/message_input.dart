part of '../chat_part.dart';

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
    super.key,
    required this.onMessageEntered,
    required this.isConnected,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
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
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: AppOutlinedButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      if (FocusScope.of(context).hasFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      widget.onMessageEntered(_textEditingController.text);

                      _textEditingController.clear();
                    }
                  },
                  child: const Icon(Icons.send),
                ),
              ),
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
