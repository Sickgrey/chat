import 'dart:async';

import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/chat_room/domain/repositories/chat_room_repository.dart';
import 'package:chat/feature/chat_room/domain/state/chat_room_event.dart';
import 'package:chat/feature/chat_room/domain/state/chat_room_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc({required this.chatRoomRepository})
      : super(const ChatRoomState.loading()) {
    _messagesSubscription.cancel();
    chatRoomRepository.messageStream.listen((message) {
      add(ChatRoomEvent.messageFetched(message: message));
    });
    on<ChatRoomOpened>(_loadMessages);
    on<ChatRoomMessageFetched>(_fetchNewMessage);
    on<ChatRoomMessageSended>(_sendMessage);
  }

  final ChatRoomRepository chatRoomRepository;
  late final StreamSubscription _messagesSubscription;

  _fetchNewMessage(ChatRoomMessageFetched event, Emitter<ChatRoomState> emit) {
    if (state is ChatRoomSuccess) {
      emit(const ChatRoomState.loading());
      final currentState = state as ChatRoomSuccess;
      final messages = currentState.messages;
      messages.add(event.message);
      emit(ChatRoomState.success(messages: messages));
    }
  }

  _sendMessage(ChatRoomMessageSended event, Emitter<ChatRoomState> emit) {
    chatRoomRepository.sendMessage(room: event.room, text: event.text);
  }

  _loadMessages(ChatRoomOpened event, Emitter<ChatRoomState> emit) {
    final messages = <Message>[];
    emit(ChatRoomState.success(messages: messages));
  }
}
