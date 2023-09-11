import 'package:logger/logger.dart';

class ChatLogger {
  static final ChatLogger _instance = ChatLogger._internal();
  late Logger logger;
  late MemoryOutput memoryOutput;

  factory ChatLogger() {
    return _instance;
  }

  ChatLogger._internal() {
    memoryOutput = MemoryOutput(bufferSize: 40);
    logger = Logger(
      filter: ProductionFilter(),
      output: memoryOutput,
      printer: SimplePrinter(colors: true),
    );
  }
}
