part of chat_part;

/// {@template messageBubble}
/// Chat message bubble.
/// {@endtemplate}
class MessageBubble extends StatelessWidget {
  /// Message.
  final Message message;

  /// {@macro messageBubble}
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colors;

    final isUserMessage = message is UserMessage;

    return Row(
      children: [
        Expanded(
          child: Wrap(
            alignment: isUserMessage ? WrapAlignment.end : WrapAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isUserMessage ? colors.uiSecond : colors.uiThird,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: !isUserMessage
                        ? Radius.circular(0)
                        : Radius.circular(12),
                    bottomRight: isUserMessage
                        ? Radius.circular(0)
                        : Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: isUserMessage
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (message.sender.username.isNotEmpty)
                      Text(
                        message.sender.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colors.black,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        message.text,
                        style: TextStyle(color: colors.black),
                        textAlign:
                            isUserMessage ? TextAlign.end : TextAlign.start,
                      ),
                    ),
                    if (isUserMessage)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 10, 10),
                        child: SizedBox(
                          width: 10,
                          height: 10,
                          child: (message as UserMessage).isSent
                              ? Icon(Icons.check, color: colors.supportFirst)
                              : CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(colors.white),
                                  strokeWidth: 2,
                                ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
