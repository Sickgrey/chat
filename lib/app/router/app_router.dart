library app_router;

import 'package:flutter/material.dart';

part 'app_screen_router.dart';

class AppRouter with AppScreenRouter {
  AppRouter._();

  static late AppRouter instance;

  static void init({int initialTab = 0}) {
    instance = AppRouter._();
  }
}
