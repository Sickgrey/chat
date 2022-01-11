import 'package:chat/app/data/entity/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_event.freezed.dart';

@freezed
class ChatRoomEvent with _$ChatRoomEvent {
  const factory ChatRoomEvent.chatRoomOpened() = ChatRoomOpened;

  const factory ChatRoomEvent.messageFetched({required Message message}) =
      ChatRoomMessageFetched;

  const factory ChatRoomEvent.messageSended({
    required String room,
    required String text,
  }) = ChatRoomMessageSended;
}
