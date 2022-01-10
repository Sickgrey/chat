library rooms_feature;

import 'package:chat/feature/rooms/domain/entity/room.dart';
import 'package:chat/feature/rooms/domain/repositories/rooms_repository.dart';
import 'package:chat/feature/rooms/domain/state/rooms_bloc.dart';
import 'package:chat/feature/rooms/domain/state/rooms_event.dart';
import 'package:chat/feature/rooms/domain/state/rooms_state.dart';
import 'package:chat/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'presentation/screens/rooms_screen.dart';

class RoomsFeature extends StatelessWidget {
  const RoomsFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoomsBloc>(
      create: (context) => RoomsBloc(roomsRepository: RoomsRepository())
        ..add(const RoomsListOpened()),
      child: BlocBuilder<RoomsBloc, RoomsState>(builder: (context, state) {
        return state.when(
          loading: () => const AppLoading(),
          success: (rooms) => RoomsScreen(rooms: rooms),
          failure: () => const AppFailure(),
        );
      }),
    );
  }
}
