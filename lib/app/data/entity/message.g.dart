// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      room: json['room'] as String,
      created: json['created'] as String,
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'room': instance.room,
      'created': instance.created,
      'sender': instance.sender.toJson(),
      'text': instance.text,
    };
