import 'package:chat/app/data/entity/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_state.freezed.dart';

@freezed
class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState.loading() = ChatRoomLoading;

  const factory ChatRoomState.success({required List<Message> messages}) =
      ChatRoomSuccess;

  const factory ChatRoomState.failure() = ChatRoomFailure;
}
