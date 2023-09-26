library root;

import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:base_codecs/base_codecs.dart';
import 'package:chat/code_kit/de_log/de_log_kit.dart';
import 'package:chat/l10n/l10n.dart';
import 'package:chat/parts/chat/chat_part.dart';
import 'package:chat/parts/developer/developer_part.dart';
import 'package:chat/parts/login/login_part.dart';
import 'package:chat/parts/rooms/rooms_part.dart';
import 'package:chat/parts/theme_selector/theme_selector_part.dart';
import 'package:de_log/de_log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation
    show kIsWeb, kReleaseMode, kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

part 'initializers/de_log.dart';
part 'initializers/dio.dart';
part 'initializers/hive_log_handler.dart';
part 'models/config.dart';
part 'models/dependency_container.dart';
part 'models/environment.dart';
part 'models/manager.dart';
part 'models/runner.dart';
part 'app.dart';
