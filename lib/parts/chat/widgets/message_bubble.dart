part of chat_part;

class MessageBubble extends StatelessWidget {
  final Message message;

  MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Wrap(
            alignment: message is UserMessage
                ? WrapAlignment.end
                : WrapAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: message is UserMessage
                      ? Theme.of(context).primaryColor
                      : Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: !(message is UserMessage)
                        ? Radius.circular(0)
                        : Radius.circular(12),
                    bottomRight: message is UserMessage
                        ? Radius.circular(0)
                        : Radius.circular(12),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: message is UserMessage
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: <Widget>[
                    if (message.sender.username.isNotEmpty)
                      Text(
                        '${message.sender.username}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: message is UserMessage
                              ? Colors.black
                              : Colors.orangeAccent,
                        ),
                      ),
                    Text(
                      '${message.text}',
                      style: TextStyle(
                        color: message is UserMessage
                            ? Colors.black
                            : Colors.grey[900],
                      ),
                      textAlign: message is UserMessage
                          ? TextAlign.end
                          : TextAlign.start,
                    ),
                    if (message is UserMessage)
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 10, top: 6),
                        child: SizedBox(
                          width: 10,
                          height: 10,
                          child: (message as UserMessage).isSent
                              ? Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                  strokeWidth: 2,
                                ),
                        ),
                      )
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
