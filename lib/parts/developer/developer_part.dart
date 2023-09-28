library developer_part;

import 'dart:convert';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:chat/code_kit/de_log/de_log_kit.dart';
import 'package:chat/l10n/l10n.dart';
import 'package:chat/parts/environment/cubit/environment_cubit.dart';
import 'package:chat/root/root.dart';
import 'package:chat/ui_kit/ui_kit.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:share_plus/share_plus.dart';

part 'bloc/developer_log_bloc.dart';
part 'bloc/developer_log_event.dart';
part 'bloc/developer_log_state.dart';
part 'models/pagination_log_loader.dart';
part 'models/renderable_record.dart';
part 'screens/environment_manager.dart';
part 'screens/log_screen.dart';
part 'widgets/app_version_info.dart';
part 'widgets/developer_log_builder.dart';
