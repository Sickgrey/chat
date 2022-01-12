import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/chat_room/domain/repositories/chat_room_repository.dart';
import 'package:chat/feature/chat_room/domain/state/chat_room_event.dart';
import 'package:chat/feature/chat_room/domain/state/chat_room_state.dart';
import 'package:chat/feature/rooms/domain/repositories/rooms_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc({
    required this.chatRoomRepository,
    required this.roomsRepository,
  }) : super(const ChatRoomState.loading()) {
    chatRoomRepository.messageStream.listen((message) {
      add(ChatRoomEvent.messageFetched(message: message));
    }, onDone: () {
      chatRoomRepository.initWebSocketConnection();
    }, onError: (error) {
      chatRoomRepository.initWebSocketConnection();
    });
    on<ChatRoomOpened>(_loadMessages);
    on<ChatRoomMessageFetched>(_fetchNewMessage);
    on<ChatRoomMessageSended>(_sendMessage);
  }

  final ChatRoomRepository chatRoomRepository;
  final RoomsRepository roomsRepository;

  _fetchNewMessage(ChatRoomMessageFetched event, Emitter<ChatRoomState> emit) {
    if (state is ChatRoomSuccess) {
      final currentState = state as ChatRoomSuccess;
      final messages = currentState.messages;
      emit(const ChatRoomState.loading());
      messages.add(event.message);
      emit(ChatRoomState.success(messages: messages));
    }
  }

  _sendMessage(ChatRoomMessageSended event, Emitter<ChatRoomState> emit) {
    chatRoomRepository.sendMessage(room: event.room, text: event.text);
  }

  _loadMessages(ChatRoomOpened event, Emitter<ChatRoomState> emit) async {
    try {
      final messages = event.isNewRoom
          ? <Message>[]
          : await roomsRepository.loadMessagesHistory(room: event.room);
      emit(ChatRoomState.success(messages: messages));
    } catch (e) {
      emit(const ChatRoomState.failure());
    }
  }
}
