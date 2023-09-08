part of rooms_part;

class MessageRepository {
  final Duration reconnectDuration;
  final Duration pingDuration;
  final User user;
  final _messages = PublishSubject<Message>();
  final _connectivityCheckService;
  IOWebSocketChannel? _socket;
  StreamSubscription? _socketSubscription;

  MessageRepository({
    required this.user,
    this.reconnectDuration = const Duration(seconds: 3),
    this.pingDuration = const Duration(seconds: 1),
  }) : _connectivityCheckService = ConnectivityCheckService(
            pingDuration: pingDuration, hosts: ['nane.tada.team']);

  Stream<Message> get messageStream {
    if (_socket == null) {
      _connect();
    }
    return _messages.stream;
  }

  Stream<ConnectionStatus> get connectionStatusStream =>
      _connectivityCheckService.connectionStream;

  void sendMessage(Message message) {
    assert(_socket != null,
        "Вебсокет не инициализирован, сначала нужно вызвать messageStream");
    _socket?.sink.add(json.encode(message.toJson()));
  }

  void dispose() {
    _socketSubscription?.cancel();
    _socket?.sink.close();
    _messages.close();
    _connectivityCheckService?.dispose();
  }

  void _listen() {
    _socketSubscription = _socket?.stream.listen(
      (message) =>
          _messages.add(parseMessage(json.decode(message), user.username)),
      onError: (e) => _reconnect(),
      cancelOnError: true,
      onDone: () => _reconnect(),
    );
  }

  void _reconnect() async {
    await Future.delayed(reconnectDuration);
    _connect();
  }

  void _connect() {
    _socket = IOWebSocketChannel.connect(
        'wss://nane.tada.team/ws?username=${user.username}',
        pingInterval: pingDuration);
    _listen();
  }
}
