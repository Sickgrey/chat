part of '../root.dart';

/// Type abbreviation for [DeLog<DeLogRecord>].
typedef AppLogger = DeLog<DeLogRecord>;

/// Returns the initialized [DeLog] instance with the [HiveQueueLogHandler]
/// and the [PrintHandler] if the app isn't in release mode.
DeLog<DeLogRecord> initializeDeLog(HiveQueueLogHandler hiveHandler) =>
    DeLog<DeLogRecord>(
      [if (!foundation.kReleaseMode) PrintHandler(), hiveHandler],
    );
