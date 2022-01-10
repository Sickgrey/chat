// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomRemote _$RoomRemoteFromJson(Map<String, dynamic> json) => RoomRemote(
      name: json['name'] as String,
      lastMessage:
          Message.fromJson(json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoomRemoteToJson(RoomRemote instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_message': instance.lastMessage.toJson(),
    };
