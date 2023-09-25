part of '../rooms_part.dart';

/// {@template messageRepository}
/// Implementation of [IMessageRepository] with production functionality.
/// {@endtemplate}
class MessageRepository implements IMessageRepository {
  /// Reconnect duration.
  final Duration reconnectDuration;

  /// Ping duration.
  final Duration pingDuration;

  /// User.
  final User user;

  /// Messages stream controller.
  final _messages = PublishSubject<Message>();

  /// Connectivity check service.
  final ConnectivityCheckService _connectivityCheckService;

  /// WebSocket channel.
  IOWebSocketChannel? _socket;

  /// WebSocket stream subscription.
  StreamSubscription? _socketSubscription;

  /// {@macro messageRepository}
  MessageRepository({
    required this.user,
    this.reconnectDuration = const Duration(seconds: 3),
    this.pingDuration = const Duration(seconds: 1),
  }) : _connectivityCheckService = ConnectivityCheckService(
            pingDuration: pingDuration, hosts: ['nane.tada.team']);

  @override
  Stream<Message> get messageStream {
    if (_socket == null) {
      _connect();
    }
    return _messages.stream;
  }

  @override
  Stream<ConnectionStatus> get connectionStatusStream =>
      _connectivityCheckService.connectionStream;

  @override
  void sendMessage(Message message) {
    assert(_socket != null,
        "Вебсокет не инициализирован, сначала нужно вызвать messageStream");
    _socket?.sink.add(json.encode(message.toJson()));
  }

  @override
  void dispose() {
    _socketSubscription?.cancel();
    _socket?.sink.close();
    _messages.close();
    _connectivityCheckService.dispose();
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
