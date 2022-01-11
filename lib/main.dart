import 'package:chat/feature/chat_room/chat_room_feature.dart';
import 'package:chat/feature/rooms/rooms_feature.dart';
import 'package:chat/uikit/uikit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputName(),
    );
  }
}
