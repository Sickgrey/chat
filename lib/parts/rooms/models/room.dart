part of '../rooms_part.dart';

class Room extends Equatable {
  final String name;
  final Message message;

  const Room({required this.name, required this.message});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      name: json['name'],
      message: ReceivedMessage.fromJson(json['last_message']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['last_message'] = message.toJson();

    return data;
  }

  Room copyWith({
    String? name,
    Message? message,
  }) {
    return Room(
      name: name ?? this.name,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [name, message];
}
