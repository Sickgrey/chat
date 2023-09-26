import 'dart:io';
import 'dart:async';

import 'package:rxdart/rxdart.dart';

enum ConnectionStatus { active, connecting }

class ConnectivityCheckService {
  final Duration pingDuration;
  final List<String> hosts;
  final _connectionSubject = PublishSubject<ConnectionStatus>();
  StreamSubscription? _tickerSubscription;

  ConnectivityCheckService({required this.pingDuration, required this.hosts})
      : assert(hosts.isNotEmpty);

  Stream<ConnectionStatus> get connectionStream async* {
    if (_tickerSubscription == null) {
      yield await connectivityCheck(hosts);
      _checkConnection();
    }
    yield* _connectionSubject.stream;
  }

  void _checkConnection() {
    _tickerSubscription = Stream.periodic(pingDuration).listen((_) async {
      _tickerSubscription?.pause();

      _connectionSubject.add(await connectivityCheck(hosts));

      _tickerSubscription?.resume();
    });
  }

  static Future<ConnectionStatus> connectivityCheck(List<String> hosts) async {
    List<bool> results = await Future.wait(hosts.map((e) => _lookupHost(e)));
    if (!results.contains(true)) {
      return ConnectionStatus.connecting;
    } else {
      return ConnectionStatus.active;
    }
  }

  static Future<bool> _lookupHost(String host) async {
    try {
      final result = await InternetAddress.lookup(host);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on SocketException catch (_) {
      return Future.value(false);
    }
  }

  void dispose() {
    _connectionSubject.close();
    _tickerSubscription?.cancel();
  }
}
