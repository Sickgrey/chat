library chat_room_feature;

import 'package:chat/app/data/entity/message.dart';
import 'package:chat/feature/chat_room/domain/repositories/chat_room_repository.dart';
import 'package:chat/feature/chat_room/domain/state/chat_room_bloc.dart';
import 'package:chat/feature/chat_room/domain/state/chat_room_event.dart';
import 'package:chat/feature/chat_room/domain/state/chat_room_state.dart';
import 'package:chat/feature/rooms/domain/repositories/rooms_repository.dart';
import 'package:chat/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'presentation/screens/chat_room_screen.dart';

class ChatRoomFeature extends StatelessWidget {
  const ChatRoomFeature({Key? key, required this.room}) : super(key: key);

  final String room;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatRoomBloc>(
      create: (context) => ChatRoomBloc(
        chatRoomRepository: ChatRoomRepository(),
        roomsRepository: RoomsRepository(),
      )..add(ChatRoomEvent.chatRoomOpened(room: room)),
      child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
        builder: (context, state) {
          return state.when(
            loading: () => const AppLoading(),
            success: (messages) => ChatRoomScreen(
              room: room,
              messages: messages,
            ),
            failure: () => const AppFailure(),
          );
        },
      ),
    );
  }
}
