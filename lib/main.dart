import 'package:chat/app/presentation/my_app.dart';
import 'package:chat/app/router/app_router.dart';
import 'package:chat/di/injectable.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  AppRouter.init();
  runApp(const MyApp());
}
