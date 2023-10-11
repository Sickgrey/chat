library chat_part;

import 'dart:async';

import 'package:chat/code_kit/de_log/de_log_kit.dart';
import 'package:chat/l10n/l10n.dart';
import 'package:chat/root/root.dart';
import 'package:chat/ui_kit/ui_kit.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:chat/code_kit/sevices/connectivity_check.dart';
import 'package:chat/parts/login/login_part.dart';
import 'package:chat/parts/rooms/rooms_part.dart';
import 'package:chat/code_kit/sevices/chat_logger.dart';
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
part 'screens/chat_screen.dart';
part 'widgets/message_bubble.dart';
part 'widgets/message_input.dart';

/// {@template chatPart}
/// Chat part widget.
/// {@endtemplate}
class ChatPart extends StatelessWidget {
  /// Room name.
  final String roomName;

  /// User.
  final User user;

  /// New room.
  final bool isRoomNew;

  /// {@macro chatPart}
  const ChatPart({
    super.key,
    required this.roomName,
    required this.user,
    this.isRoomNew = false,
  });

  @override
  Widget build(BuildContext context) {
    final dependencyContainer = context.read<DependencyContainer>();

    return BlocProvider(
      create: (context) => ChatBloc(
        logger: dependencyContainer.logger,
        messageRepository: context.read<MessageRepository>(),
        room: roomName,
        user: user,
        chatRepository: dependencyContainer.iChatRepository,
      )..add(ChatFetched(isRoomNew: isRoomNew)),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatLoadSuccess) {
            return ChatScreen(state: state);
          } else {
            return const AppLoadingScreen();
          }
        },
      ),
    );
  }
}
