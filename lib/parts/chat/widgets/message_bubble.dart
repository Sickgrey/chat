part of '../chat_part.dart';

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
    final isUserMessage = message is UserMessage;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isUserMessage ? theme.primaryColorLight : theme.cardColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: !isUserMessage
                  ? const Radius.circular(0)
                  : const Radius.circular(12),
              bottomRight: isUserMessage
                  ? const Radius.circular(0)
                  : const Radius.circular(12),
            ),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.7,
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: isUserMessage
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.start,
            children: [
              if (message.sender?.username.isNotEmpty ?? false)
                Text(
                  message.sender!.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.outline,
                  ),
                  textAlign: TextAlign.start,
                ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  message.text,
                  style: TextStyle(color: theme.colorScheme.outline),
                ),
              ),
              if (isUserMessage)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: (message as UserMessage).isSent
                      ? Icon(
                          Icons.check,
                          color: theme.colorScheme.surface,
                          size: 18,
                        )
                      : CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              theme.colorScheme.background),
                          strokeWidth: 2,
                        ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
