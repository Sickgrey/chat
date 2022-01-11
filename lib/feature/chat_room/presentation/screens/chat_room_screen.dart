part of '../../chat_room_feature.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: _MessageItem(),
                    );
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 2),
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
                      onPressed: () {},
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
  const _MessageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 4, 4),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Username',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Messageeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 8, 8),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text('Date'),
            ),
          ),
        ],
      ),
    );
  }
}
