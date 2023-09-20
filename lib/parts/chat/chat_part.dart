library chat_part;

import 'dart:async';

import 'package:chat/l10n/l10n.dart';
import 'package:chat/ui_kit/ui_kit.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:chat/sevices/connectivity_check.dart';
import 'package:chat/parts/login/login_part.dart';
import 'package:chat/parts/rooms/rooms_part.dart';
import 'package:chat/sevices/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc/chat_bloc.dart';
part 'bloc/chat_event.dart';
part 'bloc/chat_state.dart';
part 'data_provider/chat_data_provider.dart';
part 'data_provider/i_chat_data_provider.dart';
part 'models/message.dart';
part 'repository/chat_repository.dart';
part 'repository/i_chat_repository.dart';
part 'screens/chat_log.dart';
part 'screens/chat_main.dart';
part 'screens/chat.dart';
part 'widgets/message_bubble.dart';
part 'widgets/message_input.dart';
