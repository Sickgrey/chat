part of chat_part;

Message parseMessage(Map<String, dynamic> messageJson, String username) {
  if (messageJson['sender'] != null &&
      messageJson['sender']['username'] == username)
    return UserMessage.fromJson(messageJson);
  else
    return ReceivedMessage.fromJson(messageJson);
}

abstract class Message extends Equatable {
  final String room;
  final String text;
  final String? id;
  final String? created;
  final Sender? sender;

  const Message({
    required this.room,
    required this.text,
    this.id,
    this.created,
    this.sender,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['room'] = this.room;
    data['created'] = this.created;
    data['sender'] = this.sender?.toJson();
    data['text'] = this.text;

    return data;
  }

  @override
  List<Object?> get props => [room, created, sender, text, id];

  @override
  String toString() {
    return 'Message{room: $room, created: $created, text: $text, id: $id}';
  }
}

class ReceivedMessage extends Message {
  const ReceivedMessage({
    required String room,
    required String created,
    required Sender sender,
    required String text,
    String? id,
  }) : super(
          room: room,
          created: created,
          sender: sender,
          text: text,
          id: id,
        );

  factory ReceivedMessage.fromJson(Map<String, dynamic> json) {
    return ReceivedMessage(
      id: json['id'] as String?,
      room: json['room'],
      created: json['created'],
      sender: Sender.fromJson(json['sender']),
      text: json['text'],
    );
  }
}

class UserMessage extends Message {
  final bool isSent;

  const UserMessage({
    required String room,
    required String text,
    String? id,
    String? created,
    Sender? sender,
    this.isSent = false,
  }) : super(
          room: room,
          created: created,
          sender: sender,
          text: text,
          id: id,
        );

  factory UserMessage.fromJson(Map<String, dynamic> json) {
    return UserMessage(
      isSent: true,
      id: json['id'] as String?,
      room: json['room'],
      created: json['created'],
      sender: Sender.fromJson(json['sender']),
      text: json['text'],
    );
  }

  UserMessage copyWith({
    bool? isSent,
  }) {
    return UserMessage(
      isSent: isSent ?? this.isSent,
      room: room,
      created: created,
      sender: sender,
      text: text,
      id: id,
    );
  }
}

class Sender extends Equatable {
  final String username;

  const Sender({required this.username});

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = this.username;
    return data;
  }

  @override
  List<Object> get props => [username];
}
