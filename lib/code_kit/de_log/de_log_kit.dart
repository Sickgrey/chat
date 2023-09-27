library de_log_kit;

import 'dart:async';
import 'dart:convert';

import 'package:chat/parts/developer/developer_part.dart';
import 'package:chat/root/root.dart';
import 'package:data_queue/data_queue.dart';
import 'package:de_log/de_log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'de_log_interceptor.dart';
part 'record.dart';

/// The class prints all records.
class PrintHandler extends LogHandler<DeLogRecord> {
  @override
  void handle(RecordData<DeLogRecord> data) {
    //ignore:avoid_print
    print("Level: ${describeEnum(data.level)} \nData: ${data.record}");
  }

  @override
  Future<void> dispose() async {}
}

/// {@template hiveQueueLogHandler}
/// The class stores all records in the hive.
/// {@endtemplate}
class HiveQueueLogHandler extends QueueLogHandler<DeLogRecord>
    implements PaginationLogLoader {
  /// The box for records storing.
  final Box<Map<dynamic, dynamic>> box;

  /// {@macro hiveQueueLogHandler}
  HiveQueueLogHandler(this.box);
  @override
  Future<void> handleRecords() async {
    try {
      final recordData = await worker.next;
      await box.add(recordData.toHiveRecord.toJson());
      await handleRecords();
    } on TerminatedException<dynamic> {
      await box.close();
    }
  }

  @override
  Future<List<HiveRecord>> fetch(int offset, int take) async => box.keys
          .toList()
          .reversed
          .skip(offset)
          .take(take)
          .fold<List<HiveRecord>>([], (previousValue, element) {
        final record = box.get(element);
        if (record != null) {
          previousValue.add(HiveRecord.fromJson(record));
        }
        return previousValue;
      }).toList();

  @override
  Future<List<RenderableRecord>> fetchAll() async {
    return box.values.map((e) => HiveRecord.fromJson(e)).toList();
  }
}
