part of '../../chat_room_feature.dart';

class ChatRoomScreen extends StatelessWidget {
  ChatRoomScreen({
    Key? key,
    required this.room,
    required this.messages,
  }) : super(key: key);

  final String room;
  final TextEditingController messageController = TextEditingController();
  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 24),
          child: Column(
            children: [
              Expanded(
                child: messages.isNotEmpty
                    ? ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: _MessageItem(
                              message: messages[index],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('Сообщений нет'),
                      ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 4),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      splashRadius: 20,
                      icon: const Icon(Icons.send),
                      iconSize: 20.0,
                      onPressed: () {
                        context.read<ChatRoomBloc>().add(
                            ChatRoomEvent.messageSended(
                                room: room, text: messageController.text));
                        messageController.clear();
                      },
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  const _MessageItem({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    // final dateTime = DateTime.parse(message.created);
    // final date = DateFormat.yMMM(dateTime);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 4, 4),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                message.sender.username,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(message.text),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 8, 8),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text('date'),
            ),
          ),
        ],
      ),
    );
  }
}
