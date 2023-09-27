part of '../ui_kit.dart';

/// {@template appLoadingScreen}
/// App loading screen.
/// {@endtemplate}
class AppLoadingScreen extends StatelessWidget {
  /// {@macro appLoadingScreen}
  const AppLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
