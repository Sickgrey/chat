part of chat_part;

const String greetingsText = 'Всем чмоки!';

/// {@template chatBloc}
/// Chat control bloc.
/// {@endtemplate}
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  /// Room name.
  final String room;

  /// User.
  final User user;

  /// Instance of [IChatRepository].
  final IChatRepository chatRepository;

  /// Instance of [IMessageRepository].
  final IMessageRepository messageRepository;

  /// Subscription to events to receive message.
  StreamSubscription<Message>? messageSubscription;

  /// Subscription to events to update [ConnectionStatus].
  StreamSubscription<ConnectionStatus>? connectionStatusSubscription;

  /// {@macro chatBloc}
  ChatBloc({
    required this.room,
    required this.user,
    required this.chatRepository,
    required this.messageRepository,
  }) : super(ChatInitial()) {
    messageSubscription = messageRepository.messageStream
        .where((message) => message.room == room)
        .listen(
          (event) => add(ChatMessageReceived(message: event)),
        );
    connectionStatusSubscription = messageRepository.connectionStatusStream
        .listen((event) => add(ChatConnectionStatusChanged(status: event)));

    on(_onChatFetched);
    on(_onChatMessageSent);
    on(_onChatMessageReceived);
    on(_onChatConnectionStatusChanged);
  }

  Future<void> _onChatFetched(
    ChatFetched event,
    Emitter<ChatState> emit,
  ) async {
    ChatLogger().memoryOutput.buffer.clear();
    ChatLogger().logger.i('чат $room открыт');
    var history = event.isRoomNew ? <Message>[] : await _downloadChatHistory();

    emit(ChatLoadSuccess(
      connectionStatus: ConnectionStatus.active,
      room: room,
      messages: history,
      user: user,
    ));

    if (event.isRoomNew) add(ChatMessageSent(text: greetingsText));
  }

  Future<void> _onChatMessageSent(
    ChatMessageSent event,
    Emitter<ChatState> emit,
  ) async {
    if (state is ChatLoadSuccess) {
      final currentState = state as ChatLoadSuccess;

      final userMessage = UserMessage(
        text: event.text,
        id: Uuid().v1(),
        room: room,
      );
      ChatLogger().logger.i('отправка сообщения ${userMessage.text}');
      messageRepository.sendMessage(userMessage);

      emit(currentState.copyWith(messages: [
        ...[userMessage],
        ...currentState.messages
      ]));
    }
  }

  Future<void> _onChatMessageReceived(
    ChatMessageReceived event,
    Emitter<ChatState> emit,
  ) async {
    if (state is ChatLoadSuccess) {
      final currentState = state as ChatLoadSuccess;

      ChatLogger().logger.i('получение сообщения  ${event.message.text}');
      if (event.message is UserMessage &&
          currentState.messages
              .any((element) => element.id == event.message.id)) {
        final userMessage = event.message as UserMessage;

        var messages = List<Message>.from(currentState.messages);
        final index =
            messages.indexWhere((element) => element.id == userMessage.id);
        if (index > -1) {
          messages[index] = userMessage.copyWith(isSent: true);
        }
        emit(currentState.copyWith(messages: messages));
      } else {
        emit(currentState.copyWith(messages: [
          ...[event.message],
          ...currentState.messages
        ]));
      }
    }
  }

  Future<void> _onChatConnectionStatusChanged(
    ChatConnectionStatusChanged event,
    Emitter<ChatState> emit,
  ) async {
    if (state is ChatLoadSuccess) {
      final currentState = state as ChatLoadSuccess;

      if (event.status == ConnectionStatus.active) {
        if (currentState.connectionStatus == ConnectionStatus.connecting) {
          List<Message> newMessages = [];
          final chatHistory = await _downloadChatHistory();
          //  TODO: refactor
          if (chatHistory.isNotEmpty) {
            if (currentState.messages
                .any((element) => element.created?.isNotEmpty ?? false))
              newMessages = chatHistory
                  .where((element) => DateTime.parse(element.created ?? '')
                      .isAfter(DateTime.parse(currentState.messages
                          .firstWhere(
                              (element) => element.created?.isNotEmpty ?? false)
                          .created!)))
                  .toList();
            else
              newMessages = chatHistory;
          }
          if (newMessages.isNotEmpty) {
            emit(currentState.copyWith(
                messages: [...newMessages, ...currentState.messages]));
          }
        }
        var pendingUserMessages = currentState.messages
            .where((element) => element is UserMessage && !element.isSent)
            .toList();
        while (pendingUserMessages.isNotEmpty) {
          messageRepository.sendMessage(pendingUserMessages.removeLast());
        }
      }
      emit(currentState.copyWith(connectionStatus: event.status));
    }
  }

  Future<List<Message>> _downloadChatHistory() async {
    var history = <Message>[];
    try {
      history = await chatRepository.downloadChatHistory(user.username, room);
      history = history.reversed.toList();
    } catch (e) {
      ChatLogger().logger.i("ошибка при загрузке истории: $e");
      history.add(ReceivedMessage(
          room: room,
          created: DateTime.now().toString(),
          sender: Sender(username: "System"),
          text: "ошибка при загрузке истории: $e",
          id: ''));
    }
    return history;
  }

  @override
  Future<void> close() {
    messageSubscription?.cancel();
    connectionStatusSubscription?.cancel();
    return super.close();
  }
}

/// Context extension for quick access to [ChatBloc].
extension ChatBlocBuildContextX on BuildContext {
  /// Instance of [ChatBloc].
  ChatBloc get readChatBloc => read<ChatBloc>();
}
