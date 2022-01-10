import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  final String room;
  final String created;
  final User sender;
  final String text;

  Message({
    required this.room,
    required this.created,
    required this.sender,
    required this.text,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
