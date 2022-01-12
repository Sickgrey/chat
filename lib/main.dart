import 'package:chat/app/router/app_router.dart';
import 'package:chat/di/injectable.dart';
import 'package:chat/uikit/uikit.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  AppRouter.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
