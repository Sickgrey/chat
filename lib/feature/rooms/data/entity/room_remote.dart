import 'package:chat/app/data/entity/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_remote.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RoomRemote {
  final String name;
  final Message lastMessage;

  RoomRemote({
    required this.name,
    required this.lastMessage,
  });

  factory RoomRemote.fromJson(Map<String, dynamic> json) =>
      _$RoomRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$RoomRemoteToJson(this);
}
