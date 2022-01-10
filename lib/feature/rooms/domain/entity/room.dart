import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/rooms/data/entity/room_remote.dart';

class Room {
  final String name;
  final Message lastMessage;

  Room({
    required this.name,
    required this.lastMessage,
  });

  factory Room.fromRemote(RoomRemote remote) {
    return Room(
      name: remote.name,
      lastMessage: remote.lastMessage,
    );
  }
}
